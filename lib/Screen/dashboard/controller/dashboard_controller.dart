import 'package:get/get.dart';
import 'package:interview_resume_task/Models/resume_model.dart';
import 'package:interview_resume_task/Utils/AppHelper/shared_preferences.dart';

class DashBoardController extends GetxController {
  RxList<ResumeModel> resumeList = <ResumeModel>[].obs;

  @override
  void onInit() {
    getResumeFromStorage();
    super.onInit();
  }

  Future<void> getResumeFromStorage() async {
    var list = SharedPrefs.getString(key: PrefString.resumeList);
    if (list.isNotEmpty) {
      resumeList.value = resumeModelListFromJson(list);
    }
  }
}
