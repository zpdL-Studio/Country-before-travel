import 'package:country_before_travel/res/values.dart' as R; // ignore: library_prefixes, prefer_relative_imports
import 'package:flutter/material.dart';
import 'package:widgets_by_zpdl/material.dart';

import '../../widget/async_worker.dart';
import 'login_contract.dart';
import 'login_controller.dart';


class LoginPage extends AsyncWorkerBuilder<LoginController> {

  static const double hPadding = 16;
  static const double vPadding = 12;

  @override
  Widget asyncWorkerBuilder(BuildContext context) {
    final signIn = controller.socialLoginTypes.map((e) {
      switch(e) {
        case SocialLoginType.GOOGLE:
          return _SignInButton(type: SocialLoginType.GOOGLE, onTap: () {
            controller.singIn(SocialLoginType.GOOGLE);
          },);
        case SocialLoginType.ANONYMOUSLY:
          return _SignInButton(type: SocialLoginType.ANONYMOUSLY, onTap: () {
            controller.singIn(SocialLoginType.ANONYMOUSLY);
          },);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(R.string.auth.login),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            ...signIn,
            ColumnSpace(24),
          ],
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  final SocialLoginType type;
  final GestureTapCallback onTap;

  const _SignInButton({Key? key, required this.type, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AssetImage? image;
    final Color backgroundColor;
    final Color textColor;
    final String text;
    switch(type) {
      case SocialLoginType.GOOGLE:
        image = AssetImage('assets/logos/google_dark.png', package: 'flutter_signin_button');
        backgroundColor = Color(0xFF4285F4);
        textColor = Color(0xFFFFFFFF);
        text = 'Google';
        break;
      case SocialLoginType.ANONYMOUSLY:
        image = null;
        backgroundColor = R.color.backgroundColor;
        textColor = R.color.foregroundColor5;
        text = R.string.auth.anonymously;
        break;
    }

    return Padding(
      padding: EdgeInsetsOnly(horizontal: R.hPadding, vertical: 8),
      child: ElevationButton(
        onTap: onTap,
        shape: R.shape.rect(),
        color: backgroundColor,
        child: Container(
          height: 52,
          padding: const EdgeInsetsOnly(horizontal: 12, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(image != null)
                Image(image: image, width: 36, height: 36,),
              Spacer(),
              Text(
                text, style: textColor.subtitle1,
              ),
              Spacer(),
            ],
          ),
        )),
    );
  }
}
