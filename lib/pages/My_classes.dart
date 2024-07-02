import 'package:flutter/material.dart';


class MyClasses extends StatefulWidget {
  const MyClasses({super.key});

  @override
  State<MyClasses> createState() => _MyClassesState();
}

class _MyClassesState extends State<MyClasses> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('我的课程',textScaleFactor: 3,));
  }
}

