import 'package:flutter/foundation.dart';
import 'package:fuckketangpai/models/exam_list_response/exam_list_response.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/service/exam_data.dart';
import 'package:get/get.dart';

class ExamController extends GetxController {

  RxList<ExamList> exams = <ExamList>[].obs;
  final examCounts = 0.obs;
  final String courseId;

  ExamController({required this.courseId});

  Future<void> fetchExamList({required String courseId}) async {
    final response = await ExamData.get().getExamList(courseId: courseId);
    if (response.code == 10000) {
      examCounts.value = response.data.total;
      exams.value = response.data.list;
      if (kDebugMode) {
        exams.forEach((e) => print(e.title));
      }
    } else {
      Toast('获取考试列表失败');
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchExamList(courseId: courseId);
  }

}