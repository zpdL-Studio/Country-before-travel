import 'package:get/get.dart';

import '../../service/auth/auth_service.dart';
import '../../widget/async_worker.dart';
import 'login_contract.dart';

class LoginController extends GetxController with AsyncWorkerController {

  final AuthService authService;
  LoginRouteArguments? _loginRouteArguments;

  LoginController({required this.authService});

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;
    if(arguments is LoginRouteArguments) {
      _loginRouteArguments = arguments;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void singIn(SocialLoginType type) async {
    switch(type) {
      case SocialLoginType.GOOGLE:
        final result = await asyncWorkerWithError(authService.signInWithGoogle());
        if(result != null) {
          final loginRouteArguments = _loginRouteArguments;
          if(loginRouteArguments != null) {
            Get.offNamed(loginRouteArguments.name,
                arguments: loginRouteArguments.arguments,
                id: loginRouteArguments.id,
                preventDuplicates: loginRouteArguments.preventDuplicates,
                parameters: loginRouteArguments.parameters);
          } else {
            Get.back(result: true);
          }
        }
        break;
    }
  }
}