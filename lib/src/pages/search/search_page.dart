import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:country_before_travel/src/widget/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';
import 'package:widgets_by_zpdl/material/ios_out_side_unfocus_tap.dart';

import '../routes.dart';
import 'search_controller.dart';

class SearchPage extends GetWidget<SearchController> {
  @override
  Widget build(BuildContext context) {
    return IosOutSideUnFocusTab(
      child: Scaffold(
        appBar: AppBar(
          title: _buildAppbar(context),
        ),
        body: Obx(() {
          final searchedText = controller.searchedText;
          if(searchedText != null) {
            final isRecent = searchedText.isEmpty;
            final list;
            if(isRecent) {
              list = controller.recentList;
            } else {
              list = controller.searchedList;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isRecent)
                  Container(
                    padding: const EdgeInsetsOnly(top: 16, horizontal: 16),
                    child: Text(
                      '최근 검색',
                      style: R.subtitle2,
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        final model = list[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppScaleButton(
                              onTap: () {
                                controller.selectModel(model);
                              },
                              pressScale: 0.97,
                              child: RowPrefixText(
                                  prefix: '${index + 1}. ',
                                  prefixDivider: 4,
                                  text: model.countryName,
                                  style: R.bodyText1,
                                  padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16)
                              ),
                            ),
                            Divider()
                          ],
                        );
                      }
                  ),
                ),
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return Hero(
      tag: Routes.SEARCH,
      child: Material(
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
                  if(value.isEmpty) controller.showRecent();
                },
                onSubmitted: (value) {
                  controller.search();
                },
              ),
            ),
            AppScaleButton(
              onTap: () {
                controller.search();
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
      ),
    );
  }
}
