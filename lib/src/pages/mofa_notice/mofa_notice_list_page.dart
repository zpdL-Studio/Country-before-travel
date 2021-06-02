import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:get/get.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../../widget/async_worker.dart';
import '../../widget/buttons.dart';
import 'mofa_notice_controller.dart';

class MofaNoticeListPage extends AsyncWorkerBuilder<MofaNoticeListController> {

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('외교부 공지'),
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.list?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final data = controller.list?[index];
            if(data != null) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppScaleButton(
                    onTap: () {},
                    pressScale: 0.97,
                    child: RowPrefixText(
                        prefix: '${index + 1}. ',
                        prefixDivider: 4,
                        text: data.title,
                        style: R.bodyText1,
                        padding: const EdgeInsetsOnly(vertical: 16, horizontal: 16)
                    ),
                  ),
                  Divider()
                ],
              );
            }
            return Container();
          })),
    );
  }
}