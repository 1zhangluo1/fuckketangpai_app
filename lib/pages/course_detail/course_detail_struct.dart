import 'package:flutter/material.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/pages/course_detail/announcement/announcement_page.dart';
import 'package:fuckketangpai/pages/course_detail/answer_online_question/answer_question_page.dart';
import 'package:fuckketangpai/pages/course_detail/course_source/source_page.dart';
import 'package:fuckketangpai/pages/course_detail/course_ware/course_ware_page.dart';
import 'package:fuckketangpai/pages/course_detail/exam/exam_page.dart';
import 'package:fuckketangpai/pages/course_detail/homework/homework_page.dart';
import 'package:fuckketangpai/pages/course_detail/topic/topic_page.dart';
import 'package:fuckketangpai/selfwidgets/vertical_icon_button.dart';
import 'package:get/get.dart';

class CourseStruct extends StatefulWidget {
  const CourseStruct({super.key});

  @override
  State<CourseStruct> createState() => _CourseStructState();
}

class _CourseStructState extends State<CourseStruct>{

  @override
  Widget build(BuildContext context) {
    final textStyle = (fontSize) => TextStyle(fontSize: fontSize, color: Colors.white);
    final buttonTextStyle = (fontSize) => TextStyle(fontSize: fontSize, color: Colors.grey);
    final selectedTextStyle = TextStyle(fontSize: 16.0, color: Colors.blue);
    final controller = PageController();
    final titles = ['考试','作业','互动答题','资料','课件','公告','话题'];
    final categories = titles.asMap().entries.map((e) => Category(title: e.value, index: e.key, isSelected: false)).toList();
    var currentIndex = 0.obs;

    return Scaffold(
        appBar: AppBar(
          title: Text('课程详情'),
          centerTitle: true,
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
              children: [
            Container(
              height: 210,
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.3), // 调整透明度和阴暗程度
                      BlendMode.darken, // 使用 darken 模式
                    ),
                    child: Image.asset(
                      'images/course_background_test.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '2410632  (软件工程)',
                              style: textStyle(16.0),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '离散数学',
                              style: textStyle(22.0),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  '加课码： 8Y6C5T',
                                  style: textStyle(16.0),
                                ),
                                IconButton(
                                    onPressed: () => print('加课码'),
                                    icon: Icon(
                                      Icons.qr_code_scanner_outlined,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    bottom: 40,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '成员 134',
                              style: textStyle(16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 190,
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        color: Colors.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          VerticalIconButton(text: '考勤', icon: Icon(Icons.calendar_month_outlined,color: Colors.white,), onPressed: () => print('考勤')),
                          VerticalIconButton(text: '表现', icon: Icon(Icons.grade ,color: Colors.white,), onPressed: () => print('考勤')),
                          VerticalIconButton(text: '成绩', icon: Icon(Icons.token_outlined ,color: Colors.white,), onPressed: () => print('考勤')),
                          VerticalIconButton(text: '成员', icon: Icon(Icons.person_2_outlined,color: Colors.white,), onPressed: () => print('考勤')),
                          VerticalIconButton(text: '课程介绍', icon: Icon(Icons.school_outlined,color: Colors.white,), onPressed: () => print('考勤')),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // 阴影颜色
                          blurRadius: 4, // 阴影的模糊半径
                          offset: Offset(2, 2), // 阴影偏移
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories.map((e) =>
                            Obx(
                                () => Column(
                                  children: [
                                    TextButton(
                                      onPressed: e.index == currentIndex.value ? null : () {
                                        currentIndex.value = e.index;
                                        controller.jumpToPage(e.index);
                                      } ,
                                      child: Text(e.title,style: e.index == currentIndex.value ? selectedTextStyle : buttonTextStyle(14.0),)),
                                    Container(
                                      height: 2,
                                      width: 40,
                                      color: currentIndex.value == e.index
                                          ? Colors.blue
                                          : Colors.transparent,
                                    ),
                                  ],
                                ),
                            ),
                        ).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: PageView(
                        controller: controller,
                        children: [
                          ExamPage(),
                          HomeworkPage(),
                          AnswerQuestionPage(),
                          SourcePage(),
                          CourseWarePage(),
                          AnnouncementPage(),
                          TopicPage()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        )
    );
  }

}

class Category {
  final String title;
  final int index;
  final bool isSelected;

  Category({required this.title, required this.index, required this.isSelected});
}
