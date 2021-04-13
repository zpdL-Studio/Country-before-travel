import 'package:country_before_travel/src/pages/home/home_page.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const HOME = '/';

  static final routes = [
    GetPage(name: Routes.HOME, page:() => HomePage(),),
  ];

}