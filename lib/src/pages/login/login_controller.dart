import 'package:get/get.dart';

import '../../firebase/model/user/user_model.dart';
import '../../service/auth/auth_service.dart';
import '../../widget/async_worker.dart';
import 'login_contract.dart';

class LoginController extends GetxController with AsyncWorkerController {

  final AuthService authService;

  LoginController({required this.authService});

  LoginRouteArguments? _loginRouteArguments;
  List<SocialLoginType> socialLoginTypes = [];

  @override
  void onInit() {
    super.onInit();

    final arguments = Get.arguments;
    if(arguments is LoginRouteArguments) {
      _loginRouteArguments = arguments;
    }

    socialLoginTypes = SocialLoginType.values.toList();
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
    AuthModel? result;

    switch(type) {
      case SocialLoginType.GOOGLE:
        result = await asyncWorkerNullable(authService.signIn(UserAuthType.GOOGLE));
        break;
      case SocialLoginType.ANONYMOUSLY:
        result = await asyncWorkerNullable(authService.signIn(UserAuthType.ANONYMOUSLY));
        break;
    }

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
  }
}