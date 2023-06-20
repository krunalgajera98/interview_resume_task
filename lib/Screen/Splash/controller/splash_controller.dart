import 'dart:async';
import 'package:get/get.dart';
import 'package:interview_resume_task/Screen/dashboard/view/dashboard_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    getRoutes();
    super.onInit();
  }

  void getRoutes() async {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAndToNamed(
        DashBoarScreen.routeName,
      ),
    );
  }
}
