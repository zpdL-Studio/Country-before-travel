
import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:widgets_by_zpdl/material.dart';
import 'package:widgets_by_zpdl/material/ios_out_side_unfocus_tap.dart';

import '../../widget/async_worker.dart';
import '../../widget/buttons.dart';
import 'search_place_controller.dart';

class SearchPlacePage extends AsyncWorkerBuilder<SearchPlaceController> {

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    return IosOutSideUnFocusTab(
      child: Scaffold(
        appBar: AppBar(
          title: _buildAppbar(context),
        ),
        body: Obx(() {
          final list = controller.autoCompletes.value;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              final item = list[index];
              if(item is String) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppScaleButton(
                      onTap: () {
                        controller.search(item);
                      },
                      pressScale: 0.97,
                      child: Padding(
                        padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16),
                        child: Text(item, style: R.bodyText1),
                      ),
                    ),
                    Divider()
                  ],
                );
              } else if(item is AutocompletePrediction) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppScaleButton(
                      onTap: () {
                        // controller.search(item);
                      },
                      pressScale: 0.97,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16),
                        color: R.color.accentColor,
                        child: Text(item.description ?? '', style: R.bodyText1),
                      ),
                    ),
                    Divider()
                  ],
                );
              } else {
                return Container();
              }
            },
          );
        }),
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
              controller: controller.textEditingController,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              style: R.theme.backgroundColor.bodyText1,
              autofocus: true,
              cursorColor: R.color.accentColor,
              decoration: InputDecoration.collapsed(
                  hintText: '검색', hintStyle: R.theme.backgroundColor.bodyText1),
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
}


