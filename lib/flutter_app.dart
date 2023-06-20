import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_resume_task/Screen/Splash/view/splash_screen.dart';
import 'package:interview_resume_task/Utils/app_route.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        initialBinding: AppBinding(),
        getPages: getPages,

        ///  for responsive ui
        builder: (context, child) {
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            background: Container(color: const Color(0xFFF5F5F5)),
          );
        },
      ),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {}
}
