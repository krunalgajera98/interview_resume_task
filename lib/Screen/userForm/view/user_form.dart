import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_resume_task/Models/resume_model.dart';
import 'package:interview_resume_task/Screen/userForm/controller/user_form_controller.dart';
import 'package:interview_resume_task/Screen/userForm/view/experience_view.dart';
import 'package:interview_resume_task/Screen/userForm/view/language.dart';
import 'package:interview_resume_task/Screen/userForm/view/link_view.dart';
import 'package:interview_resume_task/Screen/userForm/view/programming_lng.dart';

import 'package:interview_resume_task/Utils/AppColor/app_color.dart';
import 'package:interview_resume_task/Utils/AppFunction/app_function.dart';
import 'package:interview_resume_task/Utils/AppHelper/dimensions.dart';
import 'package:interview_resume_task/Utils/AppHelper/shared_preferences.dart';
import 'package:interview_resume_task/Utils/AppHelper/size_helper.dart';
import 'package:interview_resume_task/Utils/AppHelper/text_theme.dart';
import 'package:interview_resume_task/Utils/AppString/app_string.dart';
import 'package:interview_resume_task/Utils/AppValidator/app_validator.dart';
import 'package:interview_resume_task/Utils/AppWidget/app_button.dart';
import 'package:interview_resume_task/Utils/AppWidget/round_text_field.dart';

class UserFormDetails extends StatelessWidget {
  static const routeName = '/UserFormDetails';
  final UserFormController userFormController = Get.put(UserFormController());

  UserFormDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.primaryColor),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined, color: AppColor.white),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'RESUME',
            style: MyStyle.bold18.copyWith(color: AppColor.white),
          ),
          backgroundColor: AppColor.primaryColor,
          shadowColor: Colors.black.withOpacity(0.3),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Form(
              key: userFormController.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: Dimensions.SPACE_20,
                  ),
                  Text(
                    AppString.personalDetails,
                    style: MyStyle.bold20,
                  ),
                  const SizedBox(
                    height: Dimensions.SPACE_20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: RoundTextField(
                          hintText: AppString.firstName,
                          controller: userFormController.firstNameController,
                          validator: AppValidator.empty,
                        ),
                      ),
                      const SizedBox(
                        width: Dimensions.SPACE_10,
                      ),
                      Flexible(
                        child: RoundTextField(
                          hintText: AppString.lastName,
                          controller: userFormController.lastNameController,
                          validator: AppValidator.empty,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.SPACE_10,
                  ),
                  RoundTextField(
                    hintText: AppString.emailAddress,
                    controller: userFormController.emailController,
                    validator: AppValidator.empty,
                  ),
                  const SizedBox(
                    height: Dimensions.SPACE_10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: RoundTextField(
                          hintText: AppString.jobRole,
                          controller: userFormController.roleController,
                          validator: AppValidator.empty,
                        ),
                      ),
                      const SizedBox(
                        width: Dimensions.SPACE_10,
                      ),
                      Flexible(
                        child: RoundTextField(
                          hintText: AppString.phoneNumber,
                          controller: userFormController.mobileController,
                          validator: AppValidator.empty,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.SPACE_10,
                  ),
                  SizedBox(
                    height: Dimensions.SPACE_150,
                    child: RoundTextField(
                      controller: userFormController.summaryController,
                      validator: AppValidator.empty,
                      hintText: AppString.summary,
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.SPACE_20,
                  ),

                  /// Link
                  LinkView(),
                  const SizedBox(
                    height: Dimensions.SPACE_10,
                  ),

                  /// Experience
                  ExperienceView(),
                  const SizedBox(
                    height: Dimensions.SPACE_10,
                  ),

                  /// Skill
                  ProgrammingLng(),
                  const SizedBox(
                    height: Dimensions.SPACE_10,
                  ),

                  /// person Language
                  Language(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Dimensions.SPACE_30),
                    child: AppButton(
                      text: 'Save',
                      onTap: userFormController.onSave,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ).beResponsive;
  }
}
