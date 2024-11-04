import 'package:flutter/foundation.dart';
import 'package:fuckketangpai/service/get_course.dart';
import 'package:get/get.dart';
import '../../models/courses_list/courses_list.dart';

class RoomListController extends GetxController {
  RxList<Course> courses = <Course>[].obs;

  Future initRoom() async {
    try {
      final courseInfo = await GetCourseInfo.get().getCourses(semester: '2024-2025', term: '1');
      final onlineCourseResponse = await GetCourseInfo.get().getOnlineCourses();
      courses.clear();
      courses.addAll(courseInfo.data);
      final onlineCourses = onlineCourseResponse.data.list;
      courses.forEach((itemAll) {
        final isOnline = onlineCourses
            .any((itemOnline) => itemOnline.coursename == itemAll.coursename);
        if (isOnline) {
          print(itemAll.toString());
          itemAll.teaching = true;
          moveToTop(courses, itemAll);
        }
      });
      if (kDebugMode)
        courses.forEach((e) => e.teaching
            ? print('${e.coursename}正在上课')
            : print('${e.coursename}没有上课'));
    } catch (e) {
      print(e);
    }
  }

  void moveToTop<T>(List<T> items, T itemToMove) {
    if (items.contains(itemToMove)) {
      items.remove(itemToMove);
      items.insert(0, itemToMove);
    }
  }

  @override
  void onInit() {
    initRoom();
    super.onInit();
  }
}
