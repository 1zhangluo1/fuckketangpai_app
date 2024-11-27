import 'package:flutter/material.dart';
import 'package:fuckketangpai/models/exam_question/exam_question.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'exam_execute_controller.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({super.key, required this.question, required this.courseId, required this.testPaperId});
  
  final Lists question;
  final String courseId;
  final String testPaperId;

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {

  final textStyle = TextStyle(color: Colors.black, fontSize: 18);
  final textWeightStyle = TextStyle(color: Colors.blue, fontSize: 20);
  final groupValue = ''.obs;
  final c = Get.find<ExamExecuteController>();

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
          SizedBox(
            height: 16,
          ),
          widget.question.imgUrls.isNotEmpty
              ? Center(
            child: Image.network(
              widget.question.imgUrls[0],
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width - 150,
            ),
          ) : SizedBox(),
          ...widget.question.options.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CheckboxListTile(
                    title: Text((option.title.toString()), style: textStyle),
                    value: option.selected,
                    contentPadding: EdgeInsets.zero,
                    onChanged: (value) {
                      setState(() {
                        option.selected = !option.selected;
                      });
                    }
              ),
            );
          }).toList(),
        ],
      ),
    );;
  }
}
