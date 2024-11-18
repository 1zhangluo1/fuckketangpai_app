import 'package:flutter/material.dart';
import 'package:fuckketangpai/models/exam_list_response/exam_list_response.dart';
import 'package:fuckketangpai/pages/exam/prepare_exam_page.dart';
import 'package:fuckketangpai/selfwidgets/vertical_text_icon.dart';
import 'package:get/get.dart';
import 'exam_controller.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key, required this.courseId});

  final String courseId;

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  @override
  Widget build(BuildContext context) {
    final commonTextStyle = TextStyle(fontSize: 18,color: Colors.grey);
    final c = Get.put(ExamController(courseId: widget.courseId));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('课程内容',style: commonTextStyle,),
              Obx(() => Text('${c.examCounts.value}个活动',style: commonTextStyle,))
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: c.examCounts.value,
                itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: singleExamItem(c.exams[index]),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget singleExamItem(ExamList exam) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:
         InkWell(
           onTap: () => Get.to(PrepareExamPage(courseId: widget.courseId, testPaperId: exam.id)),
           child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalTextIcon(text: '测试', icon: Icon(Icons.newspaper_outlined,color: Colors.white, size: 18,), background: Colors.yellow, textSize: 12,),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exam.title,style: TextStyle(fontSize: 16),),
                  SizedBox(
                    height: 8,
                  ),
                  Text(exam.activitylabel,style: TextStyle(color: Colors.grey,fontSize: 12),)
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle_outline_outlined,color: Colors.greenAccent,),
                      SizedBox(width: 4,),
                      Text('已批改',style: TextStyle(color: Colors.greenAccent),),
                    ],
                  ),
                ),
              )
            ],
                   ),
         ),
    );
  }

}
