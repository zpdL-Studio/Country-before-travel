import 'package:get/get.dart';

import 'home/home_bindings.dart';
import 'home/home_page.dart';

abstract class Routes {
  static const HOME = '/';

  static final routes = [
    GetPage(
        name: Routes.HOME,
        page:() => HomePage(),
        binding: HomeBindings()
    ),
  ];
}