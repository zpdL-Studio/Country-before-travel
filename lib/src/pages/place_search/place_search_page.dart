import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../../service/google_place/google_place_model.dart';
import '../../widget/app_button.dart';
import '../../widget/async_worker.dart';
import '../../widget/glass_container.dart';
import 'place_search_bindings.dart';
import 'place_search_contract.dart';
import 'place_search_controller.dart';

class PlaceSearchPage extends AsyncWorkerBuilder<PlaceSearchController> {

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    return IosOutSideUnFocusTab(
      child: Scaffold(
        appBar: AppBar(
          title: _buildAppbar(context),
        ),
        body: Stack(
          children: [
            Obx(() {
              final List<GooglePlaceSearchResult> list = controller.searchResponse.value.results;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return SearchPlaceWidget(
                    googlePlaceSearchResult: list[index],
                    onTap: () {
                      _toPlaceDetail(list[index].placeId);
                    },
                  );
                },
              );
            }),
            Obx(() {
              final QueryAutoComplete? queryAutoComplete = controller.searchTextHasFocus.value ? controller.autoCompletes.value : null;
              final List<String> recentTexts = controller.searchTextHasFocus.value ? controller.recentTexts : [];

              final Widget child;
              final Widget disposeChild;
              if((queryAutoComplete != null && queryAutoComplete.predictions.isNotEmpty) || recentTexts.isNotEmpty) {
                final children = <Widget>[];
                if(recentTexts.isNotEmpty) {
                  final foregroundColor = R.color.primaryOverColor.withOpacity(0.9);
                  children.add(Padding(
                    padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        alignment: WrapAlignment.start,
                        children: recentTexts
                            .map((e) => AppScaleButton(
                            onTap: () {
                              controller.searchByQuery(e);
                            },
                            pressScale: 0.95,
                            shape: R.shape.rect(color: foregroundColor),
                            child: Container(
                              padding: const EdgeInsetsOnly(vertical: 4, horizontal: 8),
                              child: Text(e, style: foregroundColor.bodyText2),
                            )))
                            .toList(),
                      ),
                    ),
                  ));
                }

                if(queryAutoComplete != null && queryAutoComplete.predictions.isNotEmpty) {
                  final foregroundColor = R.color.primaryOverColor.withOpacity(0.8);
                  for (int i = 0; i < queryAutoComplete.predictions.length; i++) {
                    final item = queryAutoComplete.predictions[i];
                    children.addAll([
                      if(i > 0)
                        Divider(),
                      AppScaleButton(
                        onTap: () {
                          final placeId = item.placeId;
                          if(placeId != null) {
                            _toPlaceDetail(placeId);
                          } else {
                            controller.searchByQuery(item.structuredFormatting?.mainText ?? '');
                          }
                        },
                        pressScale: 0.97,
                        child: Padding(
                          padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16),
                          child: Row(
                            children: [
                              Container(
                                  width: 20,
                                  height: 20,
                                  margin: const EdgeInsetsOnly(end: 8),
                                  child: Icon(
                                    item.placeId != null ? Icons.place : Icons.search,
                                    color: foregroundColor,
                                    size: 20,
                                  )
                              ),
                              Expanded(child: Text(item.description ?? '', style: foregroundColor.bodyText2)),
                            ],
                          ),
                        ),
                      ),
                    ]);
                  }
                }

                child = GlassContainer(
                  key: ValueKey(queryAutoComplete?.query ?? ''),
                  opacity: 0.4,
                  sigmaX: 8.0,
                  sigmaY: 8.0,
                  color: R.color.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsOnly(vertical: 8),
                    child: ListView(
                        // mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        shrinkWrap: true,
                        children: children
                    ),
                  ),
                );

                disposeChild = GestureDetector(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                  ),
                  onTap: () {
                    controller.focusNode.unfocus();
                  },
                );
              } else {
                child = Container(
                  key: ValueKey(''),
                );
                disposeChild = Container();
              }

              return Stack(
                children: [
                  disposeChild,
                  AnimatedSwitcherSlide(
                      switchInCurve: Curves.easeOutBack,
                      switchOutCurve: Curves.easeOut,
                      alignment: Alignment.topCenter,
                      child: child),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return Material(
      color: R.color.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: R.theme.backgroundColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RowSpace(16),
          Expanded(
            child: TextField(
              focusNode: controller.focusNode,
              controller: controller.textEditingController,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              style: R.theme.backgroundColor.bodyText1,
              cursorColor: R.color.accentColor,
              decoration: InputDecoration.collapsed(
                  hintText: R.string.searchLow, hintStyle: R.theme.backgroundColor.withOpacity(0.7).bodyText1),
              onChanged: (value) {
                controller.searchText = value;
              },
              onSubmitted: (value) {
                controller.search(value);
              },
            ),
          ),
          AppScaleButton(
            onTap: () {
              controller.search(controller.textEditingController.text);
            },
            pressScale: 0.90,
            shape: CircleBorder(),
            child: Padding(
              padding: const EdgeInsetsOnly(all: 8),
              child: Icon(
                Icons.search,
                color: R.theme.backgroundColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _toPlaceDetail(String placeId) async {
    controller.focusNode.unfocus();
    final results = await PlaceSearchBindings.toDetail(placeId);
    if(controller.mode == Mode.SELECT && results != null) {
      Get.back(result: results);
    }
  }
}

class SearchPlaceWidget extends StatelessWidget {

  final GooglePlaceSearchResult googlePlaceSearchResult;
  final GestureTapCallback? onTap;

  const SearchPlaceWidget({Key? key, required this.googlePlaceSearchResult, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = googlePlaceSearchResult.icon;

    return Padding(
      padding: const EdgeInsetsOnly(top: 4, bottom: 8, horizontal: 4),
      child: ElevationButton(
        onTap: onTap,
        elevation: 8,
        color: R.color.backgroundColor,
        child: Padding(
          padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon != null ? Container(
                child: CachedNetworkImage(
                  imageUrl: icon, width: 40, height: 40, fit: BoxFit.contain,),
              ) : Container(
                width: 40, height: 40,),
              RowSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(googlePlaceSearchResult.name, style: R.subtitle2),
                    ColumnSpace(4),
                    Text(googlePlaceSearchResult.address, style: R.caption),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}