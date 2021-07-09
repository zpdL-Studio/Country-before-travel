import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'src/config/theme.dart';
import 'src/pages/routes.dart';
import 'src/service/service.dart';

void main() async {
  // await MobileAds.instance.initialize();
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initServices();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    if (defaultTargetPlatform == TargetPlatform.android) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    } else if(defaultTargetPlatform == TargetPlatform.iOS) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Country before travel',
      debugShowCheckedModeBanner: false,
      theme: themeAviary,
      darkTheme: themeAviary,
      defaultTransition: Transition.native,
      initialRoute: Routes.HOME.route,
      getPages: Routes.values.map((e) => e.page).toList(),
    );
  }
}
