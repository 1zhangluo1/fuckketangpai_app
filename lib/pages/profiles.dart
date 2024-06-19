import 'package:flutter/material.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:get/get.dart';

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              line('姓名', Global.user.value.name),
              line('学号', Global.user.value.id),
              line('手机号', Global.user.value.phone),
              line('学校', Global.user.value.school),
              line('身份', Global.user.value.identity == '0' ? '学生' : ''),
            ],
          ),
        ));
  }

  Widget line(String label, String info) {
    return ListTile(
      title: Text(label),
      trailing: Text(
        info,
        textScaleFactor: 1.5,
      ),
    );
  }
}
