import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/static.dart';

class DetailProfileInfo extends StatefulWidget {
  const DetailProfileInfo({super.key});

  @override
  State<DetailProfileInfo> createState() => _DetailProfileInfoState();
}

class _DetailProfileInfoState extends State<DetailProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 4,
          width: double.infinity,
          color: Colors.blue[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Obx(
                () => Image.network(
                  Global.user.value.headImageuri,
                  fit: BoxFit.contain,
                  width: 100,
                  height: 100,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return ClipOval(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(Global.user.value.name,textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Global.user.value.grade == '1' ? '大一' : '其余年级',textScaleFactor: 1.3,style: TextStyle(color: Colors.white),),
                  SizedBox(
                    width: 10,
                  ),
                  Text(Global.user.value.identity == '0' ? '学生' : '老师',textScaleFactor: 1.3,style: TextStyle(color: Colors.white),),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('姓名',style: TextStyle(fontSize: 20),),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
              ),
              Text(Global.user.value.name,style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('身份',style: TextStyle(fontSize: 20),),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
              ),
              Text(Global.user.value.identity == '0' ? '学生' : '老师',style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('学号',style: TextStyle(fontSize: 20),),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
              ),
              Text(Global.user.value.id,style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('电话',style: TextStyle(fontSize: 20),),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
              ),
              Text(Global.user.value.phone,style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('学校',style: TextStyle(fontSize: 20),),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
              ),
              Text(Global.user.value.school,style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('入学时间',style: TextStyle(fontSize: 20),),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4.5,
              ),
              Text(Global.user.value.enterTime,style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ],
    );
  }
}
