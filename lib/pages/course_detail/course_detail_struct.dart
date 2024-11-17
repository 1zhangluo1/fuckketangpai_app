import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    final buttonTextStyle = (fontSize) => TextStyle(fontSize: fontSize, color: Colors.black);

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('课程详情')),
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
                    height: 90,
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
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // 阴影颜色
                          blurRadius: 8, // 阴影的模糊半径
                          offset: Offset(4, 4), // 阴影偏移
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text('考试',style: buttonTextStyle(12.0),)
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text('作业',style: buttonTextStyle(12.0),)
                          ),
                          TextButton(
                              onPressed: null,
                              child: Text('互动答题',style: buttonTextStyle(12.0),)
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text('资料',style: buttonTextStyle(12.0),)
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text('课件',style: buttonTextStyle(12.0),)
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text('公告',style: buttonTextStyle(12.0),)
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text('话题',style: buttonTextStyle(12.0),)
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: PageView(
                        children: [
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
