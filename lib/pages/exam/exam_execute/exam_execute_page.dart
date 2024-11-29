import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/exam_execute_controller.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/selfwidgets/exam_confirm_dialog.dart';
import 'package:fuckketangpai/selfwidgets/keep_alive_wrapper.dart';
import 'package:fuckketangpai/selfwidgets/loading_dialog.dart';
import 'package:get/get.dart';

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
    final c = Get.put(ExamExecuteController(
        courseId: widget.courseId, testPaperId: widget.testPaperId));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(c.examQuestions.value.data.testpaper.title),
        actions: [
          Container(
            height: 30,
            child: OutlinedButton(
                onPressed: () {
                  Toast('待开发');
                },
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    side: BorderSide(color: Colors.blue)),
                child: Text(
                  '答题卡',
                  style: TextStyle(color: Colors.blue),
                )),
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            height: 30,
            child: OutlinedButton(
                onPressed: () async {
                  final result = await ExamConfirmDialog.showLoadingDialog(context: context, content: '确定提交当前试卷?');
                  if (result) {
                    LoadingDialog.showLoadingDialog(context: context, hintText: '提交中，请勿退出');
                    await c.handUpTest();
                    LoadingDialog.hideDialog(context: context);
                  }
                },
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
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Obx(
          () => PageView(
            controller: c.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: c.examQuestions.value.data.lists
                .map((question) => KeepAliveWrapper(
                    child: c.mapperQuestionType(int.tryParse(question.type) ?? 0, question)))
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        c.currentPageNumber.value <= 1
                            ? null
                            : c.currentPageNumber.value--;
                        c.pageController.jumpToPage(c.currentPageNumber.value - 1);
                      },
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
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
                      onPressed: () {
                        c.currentPageNumber.value - 1 >=
                            c.examQuestions.value.data.lists.length - 1
                            ? null
                            : c.pageController
                            .jumpToPage(c.currentPageNumber.value);
                        c.currentPageNumber.value >=
                            c.examQuestions.value.data.lists.length
                            ? Toast('已经是最后一题了哦')
                            : c.currentPageNumber.value++;
                      },
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
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
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  await c.saveAllAnswer();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Text(
                  '保存所有题目作答',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
