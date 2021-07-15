import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

import 'glass_container.dart';

Future<T?> showGlassDialog<T>({
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  bool useSafeArea = true,
}) {
  return Get.dialog(
    Builder(builder: (context) {
      var child = builder(context);
      if(useSafeArea) {
        child = SafeArea(child: child);
      }

      return GlassContainer(
          color: R.color.foregroundColor,
          child: barrierDismissible
              ? GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    color: R.color.transparent,
                    alignment: AlignmentDirectional.center,
                    child: child
                  ),
                )
              : Center(child: child));
    }),
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    useSafeArea: false,
  );
}

Future<T?> showSimpleDialog<T>({Widget? title, Widget? body, List<SimpleDialogButton<T>>? buttons}) {
  return showGlassDialog<T>(builder: (context) {
    final children = <Widget>[];
    if(title != null) {
      children.add(title);
    }
    if(body != null) {
      children.addAll([
        if(children.isNotEmpty)
          ColumnSpace(16),
        body,
      ]);
    }
    if(buttons != null && buttons.isNotEmpty) {
      children.addAll([
        if(children.isNotEmpty)
          ColumnSpace(24),
        SimpleDialogButtons<T>(
          onTap: (_) {
            Get.back(result: _);
          },
          shape: R.shape.rect(radius: 4),
          children: buttons,
        )
      ]);
    }

    return SimpleDialogContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  });
}

Text? _getSimpleTitleText(String? text) => text != null
    ? Text(
        text,
        style: R.color.foregroundColor.headline6,
      )
    : null;

Text? _getSimpleBodyText(String? text) => text != null
    ? Text(
        text,
        style: R.color.foregroundColor8.bodyText1,
      )
    : null;

Future<T?> showSimpleTextDialog<T>({String? title, String? body, List<SimpleDialogButton<T>>? buttons}) {
  return showSimpleDialog<T>(
    title: _getSimpleTitleText(title),
    body: _getSimpleBodyText(body),
    buttons: buttons
  );
}

Future<bool?> showDefaultErrorDialog(Object error) {
  final Widget? title;
  final Widget? body;
  final List<SimpleDialogButton<bool>> buttons = [
    SimpleDialogButton.cancel(
      data: false,
      text: 'Close'
    ),
  ];

  if(error is PlatformException) {
    title = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, color: R.color.foregroundColor, size: 24,),
        RowSpace(8),
        Expanded(child: _getSimpleTitleText(error.code) ?? Container())
      ],
    );
    body = _getSimpleBodyText(error.message);
  } else {
    title = null;
    body = _getSimpleBodyText(error.toString());
  }

  return showSimpleDialog<bool>(title: title, body: body, buttons: buttons);
}

const double simpleDialogOutSideMargin = 32;
const double simpleDialogHPadding = 20;

class SimpleDialogContainer extends StatelessWidget {
  final Widget child;
  const SimpleDialogContainer({Key? key, required this.child, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 0, maxWidth: 411, minHeight: 0, maxHeight: double.infinity),
      padding: const EdgeInsetsOnly(all: simpleDialogOutSideMargin),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: R.shape.rect(),
        elevation: 5,
        color: R.color.backgroundColor,
        child: Container(
          padding: const EdgeInsetsOnly(all: simpleDialogHPadding),
          child: child,
        ),
      ),
    );
  }
}

class SimpleDialogButton<T> {
  final T data;
  final Color backgroundColor;
  final Widget child;

  const SimpleDialogButton({required this.data, required this.backgroundColor, required this.child});

  static SimpleDialogButton<T> text<T>({required T data, required String text, Color? backgroundColor, TextStyle? textStyle}) {
    return SimpleDialogButton<T>(
      data: data,
      backgroundColor: backgroundColor ?? R.theme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: textStyle ?? R.bodyText1,),
      )
    );
  }

  static SimpleDialogButton<T> cancel<T>({required T data, String? text}) {
    return SimpleDialogButton.text<T>(
        data: data,
        backgroundColor: R.color.backgroundColor,
        text: text ?? 'Cancel',
        textStyle: R.color.foregroundColor5.bodyText1,
    );
  }

  static SimpleDialogButton<T> ok<T>({required T data, String? text}) {
    return SimpleDialogButton.text<T>(
      data: data,
      backgroundColor: R.color.accentColor,
      text: text ?? 'Ok',
      textStyle: R.color.foregroundColor8.bodyText1,
    );
  }
}

class SimpleDialogButtons<T> extends StatelessWidget {
  final ShapeBorder? shape;
  final Function(T data) onTap;
  final List<SimpleDialogButton<T>> children;

  const SimpleDialogButtons({
    Key? key,
    this.shape,
    required this.onTap,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [];
    for (SimpleDialogButton<T> simpleDialogButton in children) {
      if (_children.isNotEmpty) {
        _children.add(RowSpace(8));
      }

      _children.add(Expanded(
        flex: 1,
        child: ElevationButton(
          onTap: () {
            onTap(simpleDialogButton.data);
          },
          shape: shape,
          touchWellIsTop: true,
          elevation: 1,
          color: simpleDialogButton.backgroundColor,
          child: Center(child: simpleDialogButton.child),
        ),
      ));
    }

    return Container(
      height: 48,
      child: Row(
        children: _children,
      ),
    );
  }
}


