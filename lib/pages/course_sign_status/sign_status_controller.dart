import 'package:fuckketangpai/models/attence/attence.dart';
import 'package:fuckketangpai/service/get_course_status.dart';
import 'package:get/get.dart';

class SignStatusController extends GetxController {

  final String courseId;
  var attendanceCounts = 0.obs;
  var absentCounts = 0.obs;
  var lateCounts = 0.obs;
  var exitEarlyCounts = 0.obs;
  var offCounts = 0.obs;
  RxList<CourseSignInfo> courseSignInfos = <CourseSignInfo>[].obs;

  SignStatusController({required this.courseId});

  Future<void> getSignStatus({required String courseId}) async {
    final attence = await GetCourseStatus.get().getAttences(page: 1, courseId: courseId,);
    courseSignInfos.clear();
    courseSignInfos.addAll(attence.data);
    print(attence.toString());
    attendanceCounts.value = attence.attenceCount;
    lateCounts.value = attence.lateCount;
    absentCounts.value = attence.absentCount;
    exitEarlyCounts.value = attence.leaveEarlyCount;
    offCounts.value = attence.pleaseCount;
    Get.forceAppUpdate();
  }

  @override
  void onInit() async {
    super.onInit();
    await getSignStatus(courseId: courseId);
  }

}