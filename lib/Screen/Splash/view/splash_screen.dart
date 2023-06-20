import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_resume_task/Screen/Splash/controller/splash_controller.dart';
import 'package:interview_resume_task/Utils/AppHelper/size_helper.dart';
import 'package:interview_resume_task/Utils/AppHelper/text_theme.dart';
import 'package:interview_resume_task/Utils/AppString/app_string.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/SplashScreen';

  SplashScreen({Key? key}) : super(key: key);

  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            AppString.createResume,
            style: MyStyle.bold18,
          ),
        ),
      ),
    ).beResponsive;
  }
}
