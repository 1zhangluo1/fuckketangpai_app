import 'package:flutter/material.dart';

class AnswerQuestionPage extends StatefulWidget {
  const AnswerQuestionPage({super.key});

  @override
  State<AnswerQuestionPage> createState() => _AnswerQuestionPageState();
}

class _AnswerQuestionPageState extends State<AnswerQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('互动答题'),
      ),
    );
  }
}
