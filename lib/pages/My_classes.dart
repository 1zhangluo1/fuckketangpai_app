import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/sign/scan.dart';
import 'package:get/get.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/Internet/getUserInfo.dart';


class MyClasses extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<MyClasses> {

  @override
  void initState() {
    super.initState();
    getUserCoursesByToken(Global.tokens[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('课程列表'),
      ),
      body: SingleChildScrollView(child: Obx(() {
        return ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              // 切换扩展状态
              Global.semesters.list[index].isExpanded = isExpanded;
            });
          },
          children: Global.semesters.list.map<ExpansionPanel>((Semester semester) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(semester.title),
                );
              },
              body: Column(
                children: semester.courses.map((course) {
                  return ListTile(
                    leading: Icon(Icons.school),
                    title: Text(course.title),
                    subtitle:
                        Text('教师:${course.teacherName} (${course.studentCount}人)'),
                    trailing: Text(course.courseCode),
                  );
                }).toList(),
              ),
              isExpanded: semester.isExpanded,
              canTapOnHeader: true,
            );
          }).toList(),
        );
      })),
    );
  }
}
