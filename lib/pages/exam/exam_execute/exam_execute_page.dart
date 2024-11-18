import 'package:flutter/material.dart';

class ExamExecutePage extends StatefulWidget {
  const ExamExecutePage({super.key});

  @override
  State<ExamExecutePage> createState() => _ExamExecutePageState();
}

class _ExamExecutePageState extends State<ExamExecutePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('考试系统'),
      ),
    );
  }
}
