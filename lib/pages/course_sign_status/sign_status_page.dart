import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/course_sign_status/sign_status_controller.dart';
import 'package:get/get.dart';

class SignStatusPage extends StatefulWidget {
  const SignStatusPage({super.key});

  @override
  State<SignStatusPage> createState() => _SignStatusPageState();
}

class _SignStatusPageState extends State<SignStatusPage> {

  final c = Get.put(SignStatusController(courseId: Get.arguments));
  final courseId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('考勤详情'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: RefreshIndicator(
          onRefresh: () async => await c.getSignStatus(courseId: courseId),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      countsStatics(c.attendanceCounts.value, '出勤',Colors.green),
                      countsStatics(c.absentCounts.value, '旷课',Colors.red),
                      countsStatics(c.lateCounts.value, '迟到',Colors.orange),
                      countsStatics(c.exitEarlyCounts.value, '早退',Colors.orangeAccent),
                      countsStatics(c.offCounts.value, '请假',Colors.blue),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
  
  Widget countsStatics(int counts, String name, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(counts.toString(),style: TextStyle(fontSize: 20,color: color),),
        SizedBox(
          height: 10,
        ),
        Text(name)
      ],
    );
  }
  
}
