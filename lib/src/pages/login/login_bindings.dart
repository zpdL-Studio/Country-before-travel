import 'package:get/get.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(authService: Get.find()));
  }

  static GetPage getPage(String name) => GetPage(
    name: name,
    binding: LoginBindings(),
    page: () => LoginPage(),
  );
}