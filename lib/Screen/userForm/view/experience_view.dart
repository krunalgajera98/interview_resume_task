import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:interview_resume_task/Models/resume_model.dart';
import 'package:interview_resume_task/Screen/userForm/controller/user_form_controller.dart';
import 'package:interview_resume_task/Utils/AppHelper/dimensions.dart';
import 'package:interview_resume_task/Utils/AppHelper/text_theme.dart';
import 'package:interview_resume_task/Utils/AppString/app_string.dart';
import 'package:interview_resume_task/Utils/AppWidget/app_button.dart';
import 'package:interview_resume_task/Utils/AppWidget/expansion.dart';
import 'package:interview_resume_task/Utils/AppWidget/round_text_field.dart';

import '../../../Utils/AppColor/app_color.dart';

class ExperienceView extends StatelessWidget {
  final UserFormController userFormController = Get.find<UserFormController>();
  RxBool isEditMode = false.obs;

  ExperienceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.yourExperience,
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
              itemCount: userFormController.experienceList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                TextEditingController title =
                    TextEditingController(text: userFormController.experienceList[index].jobTitle);
                TextEditingController role = TextEditingController(text: userFormController.experienceList[index].role);
                TextEditingController startDate =
                    TextEditingController(text: userFormController.experienceList[index].startDate);
                TextEditingController endDate =
                    TextEditingController(text: userFormController.experienceList[index].endDate);
                TextEditingController city = TextEditingController(text: userFormController.experienceList[index].city);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: BorderedExpansionTile(
                    title: (userFormController.experienceList[index].jobTitle?.isEmpty ?? true)
                        ? "Test"
                        : userFormController.experienceList[index].jobTitle ?? '',
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: RoundTextField(
                                    controller: title,
                                    hintText: AppString.jobTitle,
                                    onChanged: (value) {
                                      isEditMode.value = true;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: Dimensions.SPACE_10,
                                ),
                                Flexible(
                                  child: RoundTextField(
                                    controller: role,
                                    hintText: AppString.role,
                                    onChanged: (value) {
                                      isEditMode.value = true;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Dimensions.SPACE_10,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: RoundTextField(
                                    controller: startDate,
                                    hintText: AppString.startDate,
                                    onChanged: (value) {
                                      isEditMode.value = true;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: Dimensions.SPACE_10,
                                ),
                                Flexible(
                                  child: RoundTextField(
                                    controller: endDate,
                                    hintText: AppString.endDate,
                                    onChanged: (value) {
                                      isEditMode.value = true;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Dimensions.SPACE_10,
                            ),
                            RoundTextField(
                              controller: city,
                              hintText: AppString.city,
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
                                text: isEditMode.value ? AppString.save : AppString.removeThisExperience,
                                onTap: () {
                                  if (isEditMode.value) {
                                    Experience exp = Experience(
                                        city: city.text,
                                        endDate: endDate.text,
                                        jobTitle: title.text,
                                        role: role.text,
                                        startDate: startDate.text);
                                    userFormController.experienceList[index] = exp;
                                    isEditMode.value = false;
                                  } else {
                                    userFormController.experienceList.removeAt(index);
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
            text: 'Add another experience',
            onTap: () {
              userFormController.experienceList.add(Experience());
            },
          ),
        ),
      ],
    );
  }
}
