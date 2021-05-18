import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../routes.dart';
import 'search_controller.dart';

class SearchPage extends GetWidget<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppbar(context),
      ),
      body: Container()
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
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                style: R.theme.backgroundColor.bodyText1,
                autofocus: true,
                cursorColor: R.color.accentColor,
                decoration: InputDecoration.collapsed(
                    hintText: '검색', hintStyle: R.theme.backgroundColor.bodyText1),
                onChanged: (value) {

                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsOnly(all: 8),
              child: Icon(
                Icons.search,
                color: R.theme.backgroundColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
