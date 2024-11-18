import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/models/exam_info/exam_info.dart';
import 'package:fuckketangpai/models/exam_list_response/exam_list_response.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/tools/generate_timestamp.dart';

class ExamData {

  final dio = AppNetwork.get().ketangpaiDio;

  Future<ExamExamListResponse> getExamList({required String courseId}) async {
    Map<String,dynamic> requestBody = {
      "courseid": courseId,
      "contenttype": 6,
      "dirid": 0,
      "lessonlink": [],
      "sort": [],
      "page": 1,
      "limit": 50,
      "desc": 3,
      "courserole": 0,
      "vtr_type": "",
      "reqtimestamp": DateTime.now().toMillisecondsTimestamp()
    };
    try {
      final response = await dio.post('/FutureV2/CourseMeans/getCourseContent',data: requestBody);
      final examList = ExamExamListResponse.fromJson(response.data);
      return examList;
    } on Exception catch (e) {
      Toast('考试列表获取失败：$e');
      return ExamExamListResponse.emptyInstance();
    }
  }

  Future<ExamInfo> getExamData({required String courseId,required String paperId}) async {
    final body = {
      "courseid": courseId,
      "testpaperid": paperId,
      "reqtimestamp": DateTime.now().toMillisecondsTimestamp()
    };
    try {
      final response = await dio.post('/TestpaperApi/testpaperdetails',data: body);
      final examInfo = ExamInfo.fromJson(response.data);
      return examInfo;
    } on Exception catch (e) {
      Toast('考试信息获取失败：$e');
      return ExamInfo.emptyInstance();
    }
  }

  ExamData._create();

  static ExamData? _instance;

  factory ExamData.get() => _instance ??= ExamData._create();

}