import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/exam_execute_controller.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;

class ExamExecutePage extends StatefulWidget {
  const ExamExecutePage({super.key, this.courseId, this.testPaperId});

  final courseId;
  final testPaperId;

  @override
  State<ExamExecutePage> createState() => _ExamExecutePageState();
}

class _ExamExecutePageState extends State<ExamExecutePage> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.black, fontSize: 18);
    final textWeightStyle = TextStyle(color: Colors.blue, fontSize: 20);
    final groupValue = ''.obs;
    final c = Get.put(ExamExecuteController(
        courseId: widget.courseId, testPaperId: widget.testPaperId));

    return Scaffold(
      appBar: AppBar(
        title: Text('考试系统'),
        actions: [
          Container(
            height: 30,
            child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: BorderSide(color: Colors.blue)),
                child: Text(
                  '答题卡',
                  style: TextStyle(color: Colors.blue),
                )),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            height: 30,
            child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.blue,
                    side: BorderSide(color: Colors.transparent)),
                child: Text(
                  '提交',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Obx(
                () => Row(
                  children: [
                    Text(
                      c.currentPageNumber.value.toString(),
                      style: textWeightStyle,
                    ),
                    Text(
                      '/${c.examQuestions.value.data.testpaper.totalCount.toString()}',
                      style: textStyle,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(c.examQuestions.value.data.lists[0].replenishtype, style: textStyle),
                    SizedBox(
                      width: 5,
                    ),
                    Text('(分值${c.examQuestions.value.data.lists[0].score}分，难度：${c.difficultyMapper(int.parse(c.examQuestions.value.data.lists[0].difficulty))})', style: textStyle),
                  ],
                ),
              ),
              Obx(() => SelectableText(
                  parse(c.examQuestions.value.data.lists[0].title)
                          .querySelector('p')
                          ?.text ??
                      '无内容',
                  style: textStyle)),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return c.examQuestions.value.data.lists[0].imgUrls.isNotEmpty ?
                Center(
                  child: Image.network(
                    c.examQuestions.value.data.lists[0].imgUrls[0],
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width - 150,
                  ),
                ) : SizedBox();
              }),
              SizedBox(
                height: 16,
              ),
              ...c.examQuestions.value.data.lists[0].options.map((option) {
                return Obx(
                  () => RadioListTile<String>(
                      title: Text((option.title.toString()), style: textStyle),
                      value: option.id.toString(),
                      groupValue: groupValue.value,
                      contentPadding: EdgeInsets.zero,
                      onChanged: (value) {
                        groupValue.value = value!;
                        print(value);
                        print(groupValue.value);
                      }),
                );
              }).toList(),
              // Obx(
              //   () => RadioListTile<String>(
              //       title: Text('abcd', style: textStyle),
              //       value: groupValue.value,
              //       groupValue: '1',
              //       contentPadding: EdgeInsets.zero,
              //       onChanged: (value) {
              //         groupValue.value = '1';
              //       }),
              // ),
              // Obx(
              //   () => RadioListTile<String>(
              //       title: Text('abcd', style: textStyle),
              //       value: groupValue.value,
              //       groupValue: '2',
              //       contentPadding: EdgeInsets.zero,
              //       onChanged: (value) {
              //         groupValue.value = '2';
              //       }),
              // ),
              // Obx(
              //   () => RadioListTile<String>(
              //       title: Text('abcd', style: textStyle),
              //       value: groupValue.value,
              //       groupValue: '3',
              //       contentPadding: EdgeInsets.zero,
              //       onChanged: (value) {
              //         groupValue.value = '3';
              //       }),
              // ),
              // Obx(
              //   () => RadioListTile<String>(
              //       title: Text('abcd', style: textStyle),
              //       value: groupValue.value,
              //       groupValue: '4',
              //       contentPadding: EdgeInsets.zero,
              //       onChanged: (value) {
              //         groupValue.value = '4';
              //       }),
              // ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      side: BorderSide(color: Colors.blueAccent)),
                  child: Text(
                    '上一题',
                    style: TextStyle(color: Colors.blueAccent),
                  )),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      side: BorderSide(color: Colors.transparent)),
                  child: Text(
                    '下一题',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
