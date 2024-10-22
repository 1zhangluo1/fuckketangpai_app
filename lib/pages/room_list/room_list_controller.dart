
import 'package:fuckketangpai/service/get_course.dart';
import 'package:get/get.dart';
import '../../models/courses_list/courses_list.dart';

class RoomListController extends GetxController {

  List<Course> courses = <Course>[].obs;

  Future initRoom() async {
    try {
      print('获取数据');
      final courseInfo = await GetCourseInfo.get().getCourses(
        semester: '2024-2025',
        term: '1'
      );
      courses.addAll(courseInfo.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    initRoom();
    super.onInit();
  }

}