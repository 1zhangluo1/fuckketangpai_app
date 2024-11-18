import 'package:flutter/material.dart';
import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/models/course_detail_data/course_detail_data.dart';
import 'package:fuckketangpai/pages/course_detail/announcement/announcement_page.dart';
import 'package:fuckketangpai/pages/course_detail/answer_online_question/answer_question_page.dart';
import 'package:fuckketangpai/pages/course_detail/course_source/source_page.dart';
import 'package:fuckketangpai/pages/course_detail/course_ware/course_ware_page.dart';
import 'package:fuckketangpai/pages/course_detail/exam/exam_page.dart';
import 'package:fuckketangpai/pages/course_detail/homework/homework_page.dart';
import 'package:fuckketangpai/pages/course_detail/topic/topic_page.dart';
import 'package:fuckketangpai/pages/course_sign_status/sign_status_page.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/selfwidgets/keep_alive_wrapper.dart';
import 'package:fuckketangpai/selfwidgets/vertical_icon_button.dart';
import 'package:fuckketangpai/tools/generate_timestamp.dart';
import 'package:get/get.dart';

class CourseStruct extends StatefulWidget {
  const CourseStruct({super.key, required this.courseId});

  final String courseId;

  @override
  State<CourseStruct> createState() => _CourseStructState();
}

class _CourseStructState extends State<CourseStruct>{
  
  @override
  void initState() {
    super.initState();
    getCourseDetail(widget.courseId);
  }

  final courseDetail = CourseInfo.emptyInstance().obs;
  final textStyle = (fontSize) => TextStyle(fontSize: fontSize, color: Colors.white);
  final buttonTextStyle = (fontSize) => TextStyle(fontSize: fontSize, color: Colors.grey);
  final selectedTextStyle = TextStyle(fontSize: 16.0, color: Colors.blue);
  final controller = PageController(initialPage: 0,);
  final titles = ['考试','作业','互动答题','资料','课件','公告','话题'];
  final currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final categories = titles.asMap().entries.map((e) => Category(title: e.value, index: e.key, isSelected: false)).toList();

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
              child: Obx(
                  () => Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.grey.withOpacity(0.3), // 调整透明度和阴暗程度
                        BlendMode.darken, // 使用 darken 模式
                      ),
                      child: Image.network(
                        'https:${courseDetail.value.theme.studentbgpic}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                        errorBuilder: (context,object,error) {
                          return Container(
                          );
                        },
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
                                courseDetail.value.classname,
                                style: textStyle(16.0),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                courseDetail.value.coursename,
                                style: textStyle(22.0),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '加课码： ${courseDetail.value.code}',
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
                                '成员 ${courseDetail.value.studentCount.toString()}',
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
                          VerticalIconButton(text: '考勤', icon: Icon(Icons.calendar_month_outlined,color: Colors.white,), onPressed: () => Get.to(SignStatusPage(),arguments: widget.courseId)),
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
                                      },
                                        style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
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
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller,
                        children: [
                          KeepAliveWrapper(child: ExamPage(courseId: widget.courseId,)),
                          KeepAliveWrapper(child: HomeworkPage()),
                          KeepAliveWrapper(child: AnswerQuestionPage()),
                          KeepAliveWrapper(child: SourcePage()),
                          KeepAliveWrapper(child: CourseWarePage()),
                          KeepAliveWrapper(child: AnnouncementPage()),
                          KeepAliveWrapper(child: TopicPage())
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
  
  Future<void> getCourseDetail(String courseId) async {
    final dio = AppNetwork.get().ketangpaiDio;
    print(courseId);
    final body = {
      "courseid": courseId,
      "reqtimestamp": DateTime.now().toMillisecondsTimestamp()
    };
    try {
      final response = await dio.post('/CourseBigDataApi/getCourseBaseDataV2',data: body);
      final temp = CourseDetailData.fromJson(response.data);
      if (temp.code == 10000) {
        courseDetail.value = temp.data;
      }
    } on Exception catch (e) {
      Toast('获取课程信息失败：$e');
    }
  }

}

class Category {
  final String title;
  final int index;
  final bool isSelected;

  Category({required this.title, required this.index, required this.isSelected});
}
