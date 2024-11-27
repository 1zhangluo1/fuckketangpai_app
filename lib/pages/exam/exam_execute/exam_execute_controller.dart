import 'package:flutter/cupertino.dart';
import 'package:fuckketangpai/models/exam_question/exam_question.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/fill_blank_question.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/judge_question.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/multi_select.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/short_answer_question.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/single_select.dart';
import 'package:fuckketangpai/service/exam_data.dart';
import 'package:fuckketangpai/tools/uitils.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;

class ExamExecuteController extends GetxController {
  final Rx<ExamQuestion> examQuestions = ExamQuestion.emptyInstance().obs;
  final currentPageNumber = 1.obs;
  final pageController = PageController();
  final courseId;
  final testPaperId;

  ExamExecuteController({required this.courseId, required this.testPaperId});

  Future<void> getExamQuestions(String courseId, String paperId) async {
    final temp = await ExamData.get()
        .getExamQuestions(courseId: courseId, testPaperId: paperId);
    examQuestions.value = temp;
  }

  void parseHtmlData(Lists question) {
    final htmlString = parse(question.title);
    final content = htmlString.querySelector('p')?.text ?? '无内容';
    question.options.forEach((e) {
      final htmlTitle = parse(e.title);
      e.title = htmlTitle.querySelector('p')?.text ?? e.title.toString();
    });
    final urls = htmlString.querySelectorAll('img');
    final imgUrls = urls
        .map((element) => element.attributes['src'] ?? '')
        .where((src) => src.isNotEmpty);
    question.imgUrls.addAll(imgUrls);
    question.content = content;
  }

  String difficultyMapper(int level) {
    switch (level) {
      case 1:
        return '易';
      case 2:
        return '中';
      case 3:
        return '难';
      default:
        return '未知';
    }
  }

  Widget mapperQuestionType(int type) {
    switch (type) {
      case 1:
        return JudgeQuestion();
      case 2:
        return SingleSelect(question: examQuestions.value.data.lists[currentPageNumber.value - 1]);
      case 3:
        return MultiSelect();
      case 4:
        return ShortAnswerQuestion();
      case 5:
        return FillBlankQuestion();
      case 6:
        return MultiSelect();
      default:
        return SizedBox();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getExamQuestions(courseId, testPaperId);
    examQuestions.value.data.lists.forEach((question) => parseHtmlData(question));
    debugModePrint(examQuestions.value.data.lists[0].content.toString());
  }
}
