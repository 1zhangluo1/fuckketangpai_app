import 'package:flutter/material.dart';

class CourseWarePage extends StatefulWidget {
  const CourseWarePage({super.key});

  @override
  State<CourseWarePage> createState() => _CourseWarePageState();
}

class _CourseWarePageState extends State<CourseWarePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('课件'),
      ),
    );;
  }
}
