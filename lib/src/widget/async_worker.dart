import 'dart:async';

import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

import 'dialog.dart';

mixin AsyncWorkerController on GetxController {
  final _loading = false.obs;
  int _loadingCount = 0;

  bool get loading => _loading.value;

  void showLoading() {
    if(_loadingCount > 0) {
      _loadingCount++;
    } else {
      _loadingCount = 1;
    }
    _loading.value = true;
  }

  void hideLoading() {
    _loadingCount--;
    if(_loadingCount <= 0) {
      _loadingCount = 0;
      _loading.value = false;
    }
  }

  Future<T> asyncWorker<T>(Future<T> worker) async {
    try {
      showLoading();
      return await worker;
    } catch(e) {
      rethrow;
    } finally {
      hideLoading();
    }
  }

  Future<T?> asyncWorkerWithError<T>(Future<T> worker, {bool Function(Object e)? onError}) async {
    try {
      return await asyncWorker(worker);
    } catch(e) {
      bool processError = onError != null ? onError(e) : false;
      if(!processError) {
        showDefaultErrorDialog(e);
      }
    }
    return null;
  }
}

abstract class AsyncWorkerBuilder<T extends AsyncWorkerController> extends GetView<T> {

  const AsyncWorkerBuilder({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GetBuilder<T>(
          builder: (_) => asyncWorkerBuilder(context)
        ),
        Obx(() {
          return _buildLoading(controller.loading);
        })
      ],
    );
  }

  Widget asyncWorkerBuilder(BuildContext context);
}

Widget _buildLoading(bool loading) {
  if (loading) {
    return Positioned.fill(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          alignment: AlignmentDirectional.center,
          child: CircularProgressIndicator(),
        ));
  } else {
    return Container();
  }
}
