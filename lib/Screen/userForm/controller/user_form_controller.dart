import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:interview_resume_task/Models/resume_model.dart';

import '../../../Utils/AppFunction/app_function.dart';
import '../../../Utils/AppHelper/shared_preferences.dart';

class UserFormController extends GetxController {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  RxInt resumeId = 0.obs;
  RxList<LinkData> linkList = <LinkData>[].obs;
  RxList<Experience> experienceList = <Experience>[].obs;
  RxList<String> languageList = <String>[].obs;
  RxList<String> programmingLngList = <String>[].obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController summaryController = TextEditingController();

  @override
  void onInit() {
    getInitialData();
    super.onInit();
  }

  void getInitialData() {
    var argument = Get.arguments;
    if (argument != null) {
      ResumeModel model = argument;
      resumeId.value = model.id ?? 0;
      firstNameController.text = model.firstName ?? '';
      lastNameController.text = model.lastName ?? '';
      emailController.text = model.email ?? '';
      roleController.text = model.jobRole ?? '';
      mobileController.text = model.phoneNumber ?? '';
      summaryController.text = model.summary ?? '';
      programmingLngList.value = model.programmingLanguage ?? [];
      languageList.value = model.language ?? [];
      experienceList.value = model.experience ?? [];
      linkList.value = model.link ?? [];
    }
  }

  Future<void> onSave() async {
    if (key.currentState!.validate()) {
      var resumeList = SharedPrefs.getString(key: PrefString.resumeList);
      List<ResumeModel> oldList = [];
      if (resumeList.isNotEmpty) {
        oldList = resumeModelListFromJson(resumeList);
      }
      ResumeModel dataModel = ResumeModel(
        id: oldList.isEmpty ? 1 : ((oldList.last.id)! + 1),
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        jobRole: roleController.text,
        phoneNumber: mobileController.text,
        summary: summaryController.text,
        experience: experienceList,
        link: linkList,
        language: languageList,
        programmingLanguage: programmingLngList,
      );
      if (resumeId.value != 0) {
        int? index = oldList.indexWhere((ele) => ele.id == resumeId.value);
        oldList[index] = dataModel;
      } else {
        oldList.add(dataModel);
      }
      Get.back();
      await SharedPrefs.setString(
        key: PrefString.resumeList,
        value: resumeModelListToJson(oldList),
      );
    } else {
      AppFunction.showSnackBar(title: 'Alert!', message: 'please fill all the detail');
    }
  }
}
