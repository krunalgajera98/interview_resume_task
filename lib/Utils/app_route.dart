import 'package:get/get.dart';
import 'package:interview_resume_task/Screen/Splash/view/splash_screen.dart';
import 'package:interview_resume_task/Screen/dashboard/view/dashboard_screen.dart';
import 'package:interview_resume_task/Screen/resumePreview/view/pdf_view.dart';
import 'package:interview_resume_task/Screen/userForm/view/user_form.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: UserFormDetails.routeName,
    page: () => UserFormDetails(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: DashBoarScreen.routeName,
    page: () => DashBoarScreen(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: PdfDisplay.routeName,
    page: () => PdfDisplay(),
    transition: Transition.fadeIn,
  ),
];
