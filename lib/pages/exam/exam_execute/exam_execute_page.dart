import 'package:flutter/material.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:get/get.dart';

class ExamExecutePage extends StatefulWidget {
  const ExamExecutePage({super.key});

  @override
  State<ExamExecutePage> createState() => _ExamExecutePageState();
}

class _ExamExecutePageState extends State<ExamExecutePage> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.black, fontSize: 16);
    final textWeightStyle = TextStyle(color: Colors.blue, fontSize: 18);
    final groupValue = ''.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text('考试系统'),
        actions: [
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  side: BorderSide(color: Colors.blue)),
              child: Text(
                '答题卡',
                style: TextStyle(color: Colors.blue),
              )),
          SizedBox(
            width: 8,
          ),
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.blue,
                  side: BorderSide(color: Colors.transparent)),
              child: Text(
                '提交',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    '1',
                    style: textWeightStyle,
                  ),
                  Text('/6'),
                  SizedBox(
                    width: 5,
                  ),
                  Text('判断题'),
                  SizedBox(
                    width: 5,
                  ),
                  Text(('(分值10.0分，难度：中)')),
                ],
              ),
              Text('在人的一生中，遇见之际是一件比较容易的事情。'),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.network(
                  'http://img.ketangpai.com/ketangpai.aliapp.com/1/webroot/Uploads/Download/2016-03-21/56efc9940aa08.png?OSSAccessKeyId=LTAItfPkNIKJFibY&Expires=4616801830&Signature=o4vPrg8wP0UKF7xkdKL9muLkhrY%3D',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width - 150,
                ),
              ),
            Obx(
               () => RadioListTile<String>(
                  title: Text('abcd'),
                  value: groupValue.value,
                  groupValue: '1',
                  onChanged: (value) {
                    groupValue.value = '1';
                  }),
            ),
              Obx(
                    () => RadioListTile<String>(
                    title: Text('abcd'),
                    value: groupValue.value,
                    groupValue: '2',
                    onChanged: (value) {
                      groupValue.value = '2';
                    }),
              ),
              Obx(
                    () => RadioListTile<String>(
                    title: Text('abcd'),
                    value: groupValue.value,
                    groupValue: '3',
                    onChanged: (value) {
                      groupValue.value = '3';
                    }),
              ),
              Obx(
                    () => RadioListTile<String>(
                    title: Text('abcd'),
                    value: groupValue.value,
                    groupValue: '4',
                    onChanged: (value) {
                      groupValue.value = '4';
                    }),
              ),
              Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)
                          ),
                          side: BorderSide(color: Colors.blueAccent)),
                      child: Text('上一题',style: TextStyle(color: Colors.blueAccent),)),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          ),
                          side: BorderSide(color: Colors.transparent)),
                      child: Text('下一题',style: TextStyle(color: Colors.white),)),
                ),
              ],
                              ),
                            ),
              SizedBox(
                height: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
