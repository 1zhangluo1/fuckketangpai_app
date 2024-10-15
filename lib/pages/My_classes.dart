import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/scan.dart';
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
    // TODO: implement initState
    super.initState();
    getUserCoursesByToken(Global.tokens[0]);
    // Global.semesters.list.addAll([
    //   Semester("2024-2025 (第一学期)", [
    //     Course("形策2（计算机学院）", "2322803-2322804", "EW2FVC", 236),
    //   ]),
    //   Semester("2023-2024 (第二学期)", [
    //     Course("形策2（计算机学院）", "2322803-2322804", "EW2FVC", 236),
    //     Course("中国近现代史纲要", "2322770", "YX3VGE", 116),
    //     Course("大学物理B", "2323155", "ULRG9L", 88),
    //     Course("面向对象程序设计-实验", "2023级软件工程专业", "MT7PW5", 67),
    //   ]),
    // ]);
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
