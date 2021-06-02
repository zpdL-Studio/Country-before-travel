import 'dart:io' as io;

import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';
import 'package:widgets_by_zpdl/material/ios_out_side_unfocus_tap.dart';

import '../../widget/async_worker.dart';
import '../../widget/buttons.dart';
import '../routes.dart';
import 'search_controller.dart';

class SearchPage extends AsyncWorkerBuilder<SearchController> {

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    return IosOutSideUnFocusTab(
      child: Scaffold(
        appBar: AppBar(
          title: _buildAppbar(context),
        ),
        body: Obx(() {
          final searchedText = controller.searchedText;
          if(searchedText != null) {
            final isRecent = searchedText.isEmpty;
            final List list;
            if(isRecent) {
              list = controller.recentList;
            } else {
              list = controller.searchedList;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isRecent && list.isNotEmpty)
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
                              child: Padding(
                                padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16),
                                child: Row(
                                  children: [
                                    FlagWidget(
                                      width: 30,
                                      height: 30,
                                      countryCode: model.countryCode,
                                      onFlagPath: (code) {
                                        return controller.countryFlagRepository.getFlagPath(code);
                                      },
                                    ),
                                    RowSpace(16),
                                    Expanded(child: Text(model.countryName, style: R.bodyText1)),
                                  ],
                                ),
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

class FlagWidget extends StatefulWidget {

  final String countryCode;
  final double width;
  final double height;

  final Future<String?> Function(String code) onFlagPath;

  const FlagWidget({
    Key? key,
    required this.countryCode,
    required this.onFlagPath,
    this.width = double.infinity,
    this.height = double.infinity})
      : super(key: key);

  @override
  _FlagState createState() => _FlagState();
}

class _FlagState extends State<FlagWidget> with StateSubscribeWidget {

  io.File? _file;

  @override
  void initState() {
    super.initState();

    onStateSubscribe = () => widget.onFlagPath(widget.countryCode);
    onStateSubscribeData = (data) {
      if(mounted) {
        setState(() {
          if(data is String) {
            this._file = io.File(data);
          } else {
            this._file = null;
          }
        });
      }
    };
    onStateSubscribeError = (e) {
      if(mounted) {
        setState(() {
          this._file = null;
        });
      }
    };
    stateSubscribe();
  }

  @override
  void dispose() {
    super.dispose();
    stateUnsubscribe();
  }

  @override
  void didUpdateWidget(covariant FlagWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    didUpdateStateSubscribe(() => oldWidget.countryCode != widget.countryCode);
  }

  @override
  Widget build(BuildContext context) {
    final file = _file;
    if(file != null) {
      return Material(
        clipBehavior: Clip.hardEdge,
        shape: CircleBorder(
          side: BorderSide(color: R.color.white),
        ),
        child: Container(
            width: widget.width,
            height: widget.height,
            child: Image.file(
              file,
              fit: BoxFit.cover,
            )),
      );
      // return ClipOval(
      //   child: Container(
      //       width: widget.width,
      //       height: widget.height,
      //       foregroundDecoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         border: Border.all(color: Colors.blue)
      //       ),
      //       child: Image.file(file, fit: BoxFit.cover,)
      //   ),
      // );
    }

    return Container(
      width: widget.width,
      height: widget.height,
    );
  }
}

mixin StateSubscribeWidget<T extends StatefulWidget> on State<T> {
  Object? _activeCallbackIdentity;

  Future<dynamic> Function()? onStateSubscribe;

  void Function(dynamic data)? onStateSubscribeData;
  void Function(Object error)? onStateSubscribeError;

  void didUpdateStateSubscribe(bool Function() isUpdated) {
    if(isUpdated()) {
      if(_activeCallbackIdentity != null) {
        stateUnsubscribe();
      }
      stateSubscribe();
    }
  }

  void stateSubscribe() async {
    final onStateSubscribe = this.onStateSubscribe;
    if(onStateSubscribe != null) {
      final Object callbackIdentity = Object();
      _activeCallbackIdentity = callbackIdentity;
      try {
        final onData = onStateSubscribeData;
        if(onData != null && _activeCallbackIdentity == callbackIdentity) {
          onData(await onStateSubscribe());
        }
      } catch(e) {
        final onError = onStateSubscribeError;
        if(onError != null && _activeCallbackIdentity == callbackIdentity) {
          onError(e);
        }
      }
    }
  }

  void stateUnsubscribe() {
    _activeCallbackIdentity = null;
  }
}
