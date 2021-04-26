import 'package:country_before_travel/src/pages/mofa_notice/mofa_notice.dart';
import 'package:get/get.dart';

import 'home/home_bindings.dart';
import 'home/home_page.dart';
import 'mofa_notice/mofa_notice_list_page.dart';

abstract class Routes {
  static const HOME = '/';
  static const MOFA_NOTICE_LIST = '/mofa_notice_list';


  static final routes = [
    GetPage(
      name: Routes.HOME,
      binding: HomeBindings(),
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.MOFA_NOTICE_LIST,
      binding: MofaNoticeBindings(),
      page: () => MofaNoticeListPage(),
    ),
  ];
}