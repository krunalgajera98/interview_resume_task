import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_resume_task/Models/resume_model.dart';
import 'package:interview_resume_task/Screen/dashboard/controller/dashboard_controller.dart';
import 'package:interview_resume_task/Screen/resumePreview/view/pdf_view.dart';
import 'package:interview_resume_task/Screen/userForm/view/user_form.dart';
import 'package:interview_resume_task/Utils/AppColor/app_color.dart';
import 'package:interview_resume_task/Utils/AppHelper/dimensions.dart';
import 'package:interview_resume_task/Utils/AppHelper/shared_preferences.dart';
import 'package:interview_resume_task/Utils/AppHelper/size_helper.dart';
import 'package:interview_resume_task/Utils/AppHelper/text_theme.dart';
import 'package:interview_resume_task/Utils/AppString/app_string.dart';

class DashBoarScreen extends StatelessWidget {
  static const routeName = '/DashBoarScreen';

  DashBoarScreen({Key? key}) : super(key: key);
  final DashBoardController controller = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        centerTitle: true,
        title: Text(
          AppString.dashBoard,
          style: MyStyle.bold18.copyWith(
            color: AppColor.white,
          ),
        ),
        backgroundColor: AppColor.primaryColor,
        shadowColor: Colors.black.withOpacity(0.3),
        elevation: 0,
      ),
      body: Obx(
        () => Container(
          margin: const EdgeInsets.only(
            left: Dimensions.SPACE_10,
            right: Dimensions.SPACE_10,
            top: Dimensions.SPACE_20,
          ),
          child: ListView.separated(
            itemCount: controller.resumeList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(15), boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 8,
                    offset: const Offset(2.5, 2.5),
                  ),
                ]),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    // child: Icon(Icons.person),
                    child: Text(
                      '${controller.resumeList[index].firstName?.split('').first.toUpperCase()}',
                      style: MyStyle.bold18.copyWith(color: AppColor.white),
                    ),
                  ),
                  title: Text(
                    '${controller.resumeList[index].firstName}\t${controller.resumeList[index].lastName}',
                    style: MyStyle.bold18,
                  ),
                  subtitle: Text(
                    '${controller.resumeList[index].jobRole}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          Get.to(
                            () => PdfDisplay(
                              resumeModel: controller.resumeList[index],
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.preview,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(
                            UserFormDetails.routeName,
                            arguments: controller.resumeList[index],
                          )?.then((value) {
                            controller.getResumeFromStorage();
                          });
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          controller.resumeList.removeAt(index);
                          await SharedPrefs.setString(
                            key: PrefString.resumeList,
                            value: resumeModelListToJson(controller.resumeList),
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: AppColor.errorColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: Dimensions.SPACE_20,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {
          Get.toNamed(UserFormDetails.routeName)?.then((value) {
            controller.getResumeFromStorage();
          });
        },
        child: const Icon(Icons.add),
      ),
    ).beResponsive;
  }
}
