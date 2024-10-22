import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/models/courses_list/courses_list.dart';

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

  GetCourseInfo._create();

  static GetCourseInfo? _instance;

  factory GetCourseInfo.get() => _instance ??= GetCourseInfo._create();

}