import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

mixin LoadingController on GetxController {
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

  Future<T> loadWork<T>(Future<T> worker) async {
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

class LoadingWidget<T extends LoadingController> extends GetView<T> {
  final Widget child;

  const LoadingWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Obx(() {
          return _buildLoading(controller.loading);
        })
      ],
    );
  }
}

abstract class LoadingView<T extends LoadingController> extends GetView<T> {

  const LoadingView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildChild(context),
        Obx(() {
          return _buildLoading(controller.loading);
        })
      ],
    );
  }

  Widget buildChild(BuildContext context);
}
