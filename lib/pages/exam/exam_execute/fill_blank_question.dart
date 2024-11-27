import 'package:flutter/material.dart';
import 'package:fuckketangpai/models/exam_question/exam_question.dart';
import 'package:fuckketangpai/tools/uitils.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'exam_execute_controller.dart';

class FillBlankQuestion extends StatefulWidget {
  const FillBlankQuestion(
      {super.key,
      required this.question,
      required this.courseId,
      required this.testPaperId});

  final Lists question;
  final String courseId;
  final String testPaperId;

  @override
  State<FillBlankQuestion> createState() => _FillBlankQuestionState();
}

class _FillBlankQuestionState extends State<FillBlankQuestion> {
  final textStyle = TextStyle(color: Colors.black, fontSize: 18);
  final textWeightStyle = TextStyle(color: Colors.blue, fontSize: 20);
  final c = Get.find<ExamExecuteController>();
  final answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.question.answerStringContents.asMap().forEach((index, e) {
      answerController.text += (e +
          (index < widget.question.answerStringContents.length - 1 ? '\n' : ''));
    });
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
              Obx(
                () => Text(
                  c.currentPageNumber.value.toString(),
                  style: textWeightStyle,
                ),
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
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 20),
                  child: Center(
                    child: Image.network(
                      widget.question.imgUrls[0],
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width - 150,
                    ),
                  ),
                )
              : SizedBox(
                  height: 16,
                ),
          TextField(
            maxLines: null,
            minLines: 3,
            keyboardType: TextInputType.multiline,
            controller: answerController,
            decoration: InputDecoration(
                hintText: '请在此处输入答案。若为多空填空题，则输入时每空答案需占一行',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(8))),
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
                onPressed: () {
                  c.saveAnswer(
                      courseId: widget.courseId,
                      testPaperId: widget.testPaperId,
                      subjectId: widget.question.id,
                      answer: answerController.text);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.transparent),
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.greenAccent,
                ),
                child: Text(
                  '保存答案',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
