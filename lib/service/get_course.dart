import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/models/check_course_signing/check_course_signing.dart';
import 'package:fuckketangpai/models/courses_list/courses_list.dart';
import 'package:fuckketangpai/models/online_courses/online_courses.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/tools/generate_timestamp.dart';
import 'package:fuckketangpai/tools/uitils.dart';

class GetCourseInfo {
  final dio = AppNetwork.get().ketangpaiDio;

  Future<CoursesList> getCourses({String? semester, String? term,String isStudy = '1'}) async {
    final requestBody = {
      'semester': semester,
      'term': term,
      'isstudy': isStudy,
    };
    final response = await dio.post('/CourseApi/semesterCourseList', data: requestBody);
    final coursesResponse = CoursesList.fromJson(response.data);
    return coursesResponse;
  }

  Future<OnlineCourses> getOnlineCourses() async {
    final response = await dio.post('/CourseApi/getCourseStateAll');
    final coursesResponse = OnlineCourses.fromJson(response.data);
    return coursesResponse;
  }

  Future<bool> judgeIsSigning(String courseId) async {
    final timestamp = DateTime.now();
    Map<String,dynamic> jsonData = {
      'courseid': courseId,
      'reqtimestamp': timestamp.toMillisecondsTimestamp(),
    };
    final response = await dio.post('/AttenceApi/getNotFinishAttenceStudent',data: jsonData);
    final checkForResult = CheckCourseSigning.fromJson(response.data);
    final checkResult = checkForResult.data.lists.isNotEmpty;
    return checkResult;
  }

  Future<List<CourseList>> getSigningCourses() async {
    final futureCourses = await getOnlineCourses();
    final courses = futureCourses.data.list;
    final signingCourses = (await courses.whereAsync((e) => judgeIsSigning(e.id))).toList();
    return signingCourses;
  }

  GetCourseInfo._create();

  static GetCourseInfo? _instance;

  factory GetCourseInfo.get() => _instance ??= GetCourseInfo._create();

}