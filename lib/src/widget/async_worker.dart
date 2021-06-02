import 'dart:async';

import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

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
}

abstract class AsyncWorkerBuilder<T extends AsyncWorkerController> extends GetView<T> {

  const AsyncWorkerBuilder({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        asyncWorkerBuilder(context),
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
