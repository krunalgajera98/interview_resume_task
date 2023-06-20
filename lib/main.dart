import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_resume_task/Utils/AppHelper/shared_preferences.dart';
import 'package:interview_resume_task/flutter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.initMySharedPreferences();
  runApp(MyApp());
}
