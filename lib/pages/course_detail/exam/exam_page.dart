import 'package:flutter/material.dart';
import 'package:fuckketangpai/models/exam_list_response/exam_list_response.dart';
import 'package:fuckketangpai/pages/course_detail/exam/exam_controller.dart';
import 'package:fuckketangpai/selfwidgets/vertical_icon_button.dart';
import 'package:fuckketangpai/selfwidgets/vertical_text_icon.dart';
import 'package:get/get.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  final c = Get.put(ExamController());

  @override
  Widget build(BuildContext context) {
    final commonTextStyle = TextStyle(fontSize: 18,color: Colors.grey);

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
              Text('0个活动',style: commonTextStyle,)
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: singleExamItem(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget singleExamItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
              Text('好好编辑的试卷',style: TextStyle(fontSize: 16),),
              SizedBox(
                height: 8,
              ),
              Text('考试',style: TextStyle(color: Colors.grey,fontSize: 12),)
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
    );
  }

}
