import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/course_sign_status/sign_status_controller.dart';
import 'package:get/get.dart';

class SignStatusPage extends StatefulWidget {
  const SignStatusPage({super.key});

  @override
  State<SignStatusPage> createState() => _SignStatusPageState();
}

class _SignStatusPageState extends State<SignStatusPage> {

  final c = Get.put(SignStatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('课程出勤详情'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
