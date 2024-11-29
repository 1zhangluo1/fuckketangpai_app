import 'package:flutter/cupertino.dart';
import 'package:fuckketangpai/models/exam_question/exam_question.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/fill_blank_question.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/judge_question.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/multi_select.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/short_answer_question.dart';
import 'package:fuckketangpai/pages/exam/exam_execute/single_select.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/service/exam_data.dart';
import 'package:fuckketangpai/tools/uitils.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;

class ExamExecuteController extends GetxController {
  final Rx<ExamQuestion> examQuestions = ExamQuestion.emptyInstance().obs;
  final currentPageNumber = 1.obs;
  final pageController = PageController(initialPage: 0);
  final courseId;
  final testPaperId;

  ExamExecuteController({required this.courseId, required this.testPaperId});

  Future<void> getExamQuestions(String courseId, String paperId) async {
    final temp = await ExamData.get()
        .getExamQuestions(courseId: courseId, testPaperId: paperId);
    examQuestions.value = temp;
  }

  void initialSingleAnswerStatus(Lists question) {
    List<String> savedAnswer = [];
    final type = int.parse(question.type);
    if (isPHtml(question.myanswer ?? "未作答")) {
      question.answerStringContents = parseHtmlPContent(question.myanswer!);
    } else if (type == 1 || type == 2 || type == 3 || type == 6) {
      savedAnswer = (question.myanswer ?? "未作答").split('|');
      question.options.forEach((e) {
        savedAnswer.contains(e.id) ? e.selected = true : null;
      });
    } else {
      question.answerStringContents = (question.myanswer ?? "未作答").split('\n');
    }
  }

  Future<void> saveAllSelectedAnswer() async {
    int i = 0;
    List<Future<bool>> futures = [];
    examQuestions.value.data.lists.forEach((question) {
      i++;
      int type = int.parse(question.type);
      if ( type == 1 || type == 2 ) {
        question.options.forEach((option) => option.selected ? question.myanswer = option.id.toString() : null);
      } else if (type == 3 || type == 6) {
        List<String> answers = [];
        question.options.forEach((option) {
          if (option.selected) {
            answers.add(option.id.toString());
          }
        });
        final myAnswer = answers.isEmpty ? '' : answers.join('|');
        question.myanswer = myAnswer;
      }
      debugModePrint('第$i题的回答为：${question.myanswer}');
      futures.add(ExamData.get().saveAnswer(courseId: courseId, testPaperId: testPaperId, subjectId: question.id, answer: question.myanswer.toString()));
    });
    await Future.wait(futures);
    Toast('保存完毕');
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

  List<String> parseHtmlPContent(String htmlContent) {
    final htmlString = parse(htmlContent);
    final content = htmlString.querySelectorAll('p');
    return content.map((e) => e.text).toList();
  }

  bool isPHtml(String text) {
    try {
      final document = parse(text);
      final content = document.querySelector('p')?.text;
      return content != null;
    } catch (e) {
      return false;
    }
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

  Widget mapperQuestionType(int type, Lists question) {
    switch (type) {
      case 1:
        return JudgeQuestion(question: question,courseId: courseId,testPaperId: testPaperId,);
      case 2:
        return SingleSelect(question: question,courseId: courseId,testPaperId: testPaperId,);
      case 3:
        return MultiSelect(question: question,courseId: courseId,testPaperId: testPaperId,);
      case 4:
        return ShortAnswerQuestion(question: question,courseId: courseId,testPaperId: testPaperId,);
      case 5:
        return FillBlankQuestion(question: question,courseId: courseId,testPaperId: testPaperId,);
      case 6:
        return MultiSelect(question: question,courseId: courseId,testPaperId: testPaperId,);
      default:
        return SizedBox();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await getExamQuestions(courseId, testPaperId);
    examQuestions.value.data.lists.forEach((question) {
      parseHtmlData(question);
      initialSingleAnswerStatus(question);
    });
  }
}
