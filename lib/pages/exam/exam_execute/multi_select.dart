import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'exam_execute_controller.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({super.key});

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
              Text(c.examQuestions.value.data.lists[c.currentPageNumber.value - 1].replenishtype, style: textStyle),
              SizedBox(
                width: 5,
              ),
              Text(
                  '(分值${c.examQuestions.value.data.lists[c.currentPageNumber.value - 1].score}分，难度：${c.difficultyMapper(int.parse(c.examQuestions.value.data.lists[c.currentPageNumber.value - 1].difficulty))})',
                  style: textStyle),
            ],
          ),
          SelectableText(
              parse(c.examQuestions.value.data.lists[c.currentPageNumber.value - 1].title).querySelector('p')?.text ?? '无内容',
              style: textStyle),
          SizedBox(
            height: 16,
          ),
          c.examQuestions.value.data.lists[c.currentPageNumber.value - 1].imgUrls.isNotEmpty
              ? Center(
            child: Image.network(
              c.examQuestions.value.data.lists[c.currentPageNumber.value - 1].imgUrls[0],
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width - 150,
            ),
          ) : SizedBox(),
          ...c.examQuestions.value.data.lists[c.currentPageNumber.value - 1].options.map((option) {
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
