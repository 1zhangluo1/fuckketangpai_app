import 'package:fuckketangpai/models/exam_question/exam_question.dart';
import 'package:fuckketangpai/service/exam_data.dart';
import 'package:fuckketangpai/tools/uitils.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:html/parser.dart' show parse;

class ExamExecuteController extends GetxController {
  final Rx<ExamQuestion> examQuestions = ExamQuestion.emptyInstance().obs;
  final currentPageNumber = 1.obs;
  final courseId;
  final testPaperId;

  ExamExecuteController({required this.courseId, required this.testPaperId});

  Future<void> getExamQuestions(String courseId, String paperId) async {
    final temp = await ExamData.get()
        .getExamQuestions(courseId: courseId, testPaperId: paperId);
    examQuestions.value = temp;
  }

  void parseHtmlData(String html) {
    final htmlString = parse(html);
    final content = htmlString.querySelector('p')?.text ?? '无内容';
    examQuestions.value.data.lists[0].options.forEach((e) {
      final htmlTitle = parse(e.title);
      e.title = htmlTitle.querySelector('p')?.text ?? e.title.toString();
    });
    final urls = htmlString.querySelectorAll('img');
    final imgUrls = urls
        .map((element) => element.attributes['src'] ?? '')
        .where((src) => src.isNotEmpty);
    examQuestions.value.data.lists[0].imgUrls.addAll(imgUrls);
    examQuestions.value.data.lists[0].content = content;
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

  @override
  void onInit() async {
    super.onInit();
    await getExamQuestions(courseId, testPaperId);
    examQuestions.value.data.lists[0].title =
        HtmlUnescape().convert(examQuestions.value.data.lists[0].title);
    parseHtmlData(examQuestions.value.data.lists[0].title);
    print(examQuestions.value.data.lists[0].content);
    examQuestions.value.data.lists[0].options.forEach((e) => print(e.subjectid));
  }
}
