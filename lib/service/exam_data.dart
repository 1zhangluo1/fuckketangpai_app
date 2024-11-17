import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/models/exam_list_response/exam_list_response.dart';
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
    final response = await dio.post('/FutureV2/CourseMeans/getCourseContent',data: requestBody);
    final examList = ExamExamListResponse.fromJson(response.data);
    return examList;
  }

  ExamData._create();

  static ExamData? _instance;

  factory ExamData.get() => _instance ??= ExamData._create();

}