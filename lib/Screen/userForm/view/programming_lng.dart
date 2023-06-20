import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:interview_resume_task/Screen/userForm/controller/user_form_controller.dart';
import 'package:interview_resume_task/Utils/AppHelper/dimensions.dart';
import 'package:interview_resume_task/Utils/AppHelper/text_theme.dart';
import 'package:interview_resume_task/Utils/AppString/app_string.dart';
import 'package:interview_resume_task/Utils/AppWidget/app_button.dart';
import 'package:interview_resume_task/Utils/AppWidget/expansion.dart';
import 'package:interview_resume_task/Utils/AppWidget/round_text_field.dart';

import '../../../Utils/AppColor/app_color.dart';

class ProgrammingLng extends StatelessWidget {
  ProgrammingLng({Key? key}) : super(key: key);
  final UserFormController userFormController = Get.find<UserFormController>();
  RxBool isEditMode = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.programmingLanguage,
          style: MyStyle.bold20,
        ),
        const SizedBox(
          height: Dimensions.SPACE_10,
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: userFormController.programmingLngList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final TextEditingController lngController =
                    TextEditingController(text: userFormController.programmingLngList[index]);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: BorderedExpansionTile(
                    title: userFormController.programmingLngList[index].isEmpty
                        ? "Test"
                        : userFormController.programmingLngList[index],
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            RoundTextField(
                              controller: lngController,
                              hintText: AppString.enterProgrammingLanguage,
                              onChanged: (value) {
                                isEditMode.value = true;
                              },
                            ),
                            const SizedBox(
                              height: Dimensions.SPACE_15,
                            ),
                            Obx(
                              () => AppButton(
                                color: AppColor.errorColor,
                                text: isEditMode.value ? AppString.save : 'Remove this language',
                                onTap: () {
                                  if (isEditMode.value) {
                                    userFormController.programmingLngList[index] = lngController.text;
                                    isEditMode.value = false;
                                  } else {
                                    userFormController.programmingLngList.removeAt(index);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: Dimensions.SPACE_5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AppButton(
            text: 'Add another programming language',
            onTap: () {
              userFormController.programmingLngList.add('');
            },
          ),
        ),
      ],
    );
  }
}
