import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/models/exam_info/exam_info.dart';
import 'package:fuckketangpai/models/exam_list_response/exam_list_response.dart';
import 'package:fuckketangpai/models/exam_question/exam_question.dart';
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

  Future<ExamQuestion> getExamQuestions({required String courseId, required String testPaperId}) async {
    final body = {
      'courseid': courseId,
      'reqtimestamp': DateTime.now().toMillisecondsTimestamp(),
      'testCode': "undefined",
      'testpaperid': testPaperId
    };
    var examQuestion = ExamQuestion.emptyInstance();
    try {
      final response = await dio.post('/TestpaperApi/doSubjectList',data: body);
      examQuestion = ExamQuestion.fromJson(response.data);
    } on Exception catch (e) {
      Toast('获取试卷信息错误：$e');
    } finally {
      return examQuestion;
    }
  }

  Future<bool> saveAnswer({required String courseId, required String testPaperId, required String subjectId, required String answer}) async {
    var result = false;
    final body = {
      "courseid": courseId,
      "testpaperid": testPaperId,
      "subjectid": subjectId,
      "answer": answer,
      "attachment": "",
      "reqtimestamp": DateTime.now().toMillisecondsTimestamp(),
    };
    try {
      final response = await dio.post('/TestpaperApi/saveAnswer', data: body);
      print(response.data.toString());
      if (response.data['code'] == 10000) {
        result = true;
      }
    } on Exception catch (e) {
      Toast('保存$subjectId失败：$e');
    } finally {
      return result;
    }
  }

  Future<void> handUpTest({required String courseId, required String testPaperId}) async {
    final body = {
      "courseid": courseId,
      "testpaperid": testPaperId,
      "reqtimestamp": DateTime.now().toMillisecondsTimestamp()
    };
    try {
      final response = await dio.post('/TestpaperApi/handup',data: body);
      if (response.data['code'] == 10000) {
        Toast('提交成功');
      } else {
        Toast('保存失败：${response.data['message'].toString()}');
      }
    } on Exception catch (e) {
      Toast('提交失败：$e');
    }
  }

  ExamData._create();

  static ExamData? _instance;

  factory ExamData.get() => _instance ??= ExamData._create();

}