import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import '../../../models/exam_question/exam_question.dart';
import '../../../tools/uitils.dart';
import 'exam_execute_controller.dart';

class JudgeQuestion extends StatefulWidget {
  const JudgeQuestion({super.key, required this.question, required this.courseId, required this.testPaperId});

  final Lists question;
  final String courseId;
  final String testPaperId;

  @override
  State<JudgeQuestion> createState() => _JudgeQuestionState();
}

class _JudgeQuestionState extends State<JudgeQuestion> {
  final textStyle = TextStyle(color: Colors.black, fontSize: 18);
  final textWeightStyle = TextStyle(color: Colors.blue, fontSize: 20);
  final groupValue = ''.obs;
  final c = Get.find<ExamExecuteController>();

  @override
  void initState() {
    super.initState();
    widget.question.options.forEach((e) {
      if (e.selected) {
        groupValue.value = e.id;
      }
    });
    debugModePrint(groupValue.value);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                c.currentPageNumber.value.toString(),
                style: textWeightStyle,
              ),
              Text(
                '/${c.examQuestions.value.data.lists.length.toString()}',
                style: textStyle,
              ),
              SizedBox(
                width: 5,
              ),
              Text(widget.question.replenishtype, style: textStyle),
              SizedBox(
                width: 5,
              ),
              Text(
                  '(分值${widget.question.score}分，难度：${c.difficultyMapper(int.parse(widget.question.difficulty))})',
                  style: textStyle),
            ],
          ),
          SelectableText(
              parse(widget.question.title).querySelector('p')?.text ?? '无内容',
              style: textStyle),
          widget.question.imgUrls.isNotEmpty
              ? Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Image.network(
                widget.question.imgUrls[0],
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width - 150,
              ),
            ),
          ) : SizedBox(height: 16,),
          ...widget.question.options.map((option) {
            return Obx(
                  () => RadioListTile<String>(
                  title: Text((option.title.toString()), style: textStyle),
                  value: option.id.toString(),
                  groupValue: groupValue.value,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    groupValue.value = value!;
                  }),
            );
          }).toList(),
        ],
      ),
    );
  }
}
