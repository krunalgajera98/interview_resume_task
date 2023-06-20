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

class LinkView extends StatelessWidget {
  final UserFormController userFormController = Get.find<UserFormController>();

  LinkView({Key? key}) : super(key: key);
  RxBool isEditMode = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.yourLinks,
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
              itemCount: userFormController.linkList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final TextEditingController name =
                    TextEditingController(text: userFormController.linkList[index].linkName);
                final TextEditingController url =
                    TextEditingController(text: userFormController.linkList[index].linkUrl);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: BorderedExpansionTile(
                    title: (userFormController.linkList[index].linkName?.isEmpty ?? true)
                        ? "Test"
                        : userFormController.linkList[index].linkName ?? '',
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.SPACE_10),
                        child: Row(
                          children: [
                            Flexible(
                              child: RoundTextField(
                                controller: name,
                                hintText: AppString.linkName,
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
                                controller: url,
                                hintText: AppString.linkURL,
                                onChanged: (value) {
                                  isEditMode.value = true;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: Dimensions.SPACE_20,
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.SPACE_10),
                          child: AppButton(
                            color: AppColor.errorColor,
                            text: isEditMode.value ? AppString.save : 'Remove this link',
                            onTap: () {
                              if (isEditMode.value) {
                                LinkData linkData = LinkData(
                                  linkName: name.text,
                                  linkUrl: url.text,
                                );
                                userFormController.linkList[index] = linkData;
                                isEditMode.value = false;
                              } else {
                                userFormController.linkList.removeAt(index);
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AppButton(
            text: 'Add another link',
            onTap: () {
              userFormController.linkList.add(LinkData());
            },
          ),
        ),
      ],
    );
  }
}
