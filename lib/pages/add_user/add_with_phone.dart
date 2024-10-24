import 'dart:typed_data';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/pages/add_user/add_user_controller.dart';
import 'package:fuckketangpai/tools/randoms_tring.dart';
import 'package:get/get.dart';
import '../../selfwidgets/TimeCountDown.dart';
import '../../selfwidgets/Toast.dart';

class AddWithPhone extends StatefulWidget {
  const AddWithPhone({super.key});

  @override
  State<AddWithPhone> createState() => _AddWithPhoneState();
}

class _AddWithPhoneState extends State<AddWithPhone> {

  final c = Get.find<AddUserController>() ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: c.phoneLoginKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              child: TextFormField(
                controller: c.phoneController,
                decoration: InputDecoration(
                  focusColor: Colors.blueAccent[100],
                  labelText: '电话号码',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (v) {
                  return v!.trim().length == 11 ? null : '电话号码不符合格式';
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: c.validCodeController,
                    decoration: InputDecoration(
                      labelText: '验证码',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (v) {
                      return v!.trim().isEmpty ? '验证码不能为空' : null;
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                Obx(
                      () => c.isSend.value ? TimeCountDown(countdownTime: 60,timeEndFun: () {c.isSend.value = false;},) : ElevatedButton(
                    onPressed: () {
                      if (c.phoneController.text.length == 11) {
                        getVerifyCode();
                      } else {
                        Toast('电话号码格式不对');
                      }
                    },
                    child: Text('发送验证码'),
                    style: ElevatedButton.styleFrom(
                        surfaceTintColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(

              ),
              child: ElevatedButton(
                  onPressed: () {
                    if ((c.phoneLoginKey.currentState as FormState).validate()) {
                      c.addUserByPhone(context);
                    }
                  },
                  child: Text('添加用户',style: TextStyle(fontSize: 16,letterSpacing: 5),)
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getVerifyCode() async {
    String url = 'https://openapiv5.ketangpai.com/UserApi/verify';
    final sessionId = generateRandomString();
    final verifyCodeController = c.validCodeController;
    try {
      final dio = AppNetwork.get().ketangpaiDio;
      var response = await dio.get(url,
          queryParameters: {'sessionid': sessionId},
          options: dios.Options(responseType: dios.ResponseType.bytes));
      final Uint8List imageData = Uint8List.fromList(response.data);
      Get.defaultDialog(
          barrierDismissible: false,
          title: '验证码',
          content: Column(
            children: [
              Image.memory(imageData),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: c.validCodeController,
                decoration: InputDecoration(
                  iconColor: Colors.blueAccent,
                  labelText: '请输入计算结果',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                validator: (v) {
                  return v!.trim().isEmpty ? '验证码不能为空' : null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (verifyCodeController.value.text.isNotEmpty) {
                    sendCode(verifyCodeController.value.text, sessionId,
                        c.phoneController.value.text);
                    verifyCodeController.clear();
                    Get.back();
                  } else {
                    Toast('验证码不能为空');
                  }
                },
                child: Text('确定'),
                style: ElevatedButton.styleFrom(
                    surfaceTintColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ],
          ));
    } on Exception catch (e) {
      Toast(e.toString());
    }
  }

  Future<void> sendCode(String code, String sessionId, String phone) async {
    String url = 'https://openapiv5.ketangpai.com//UserApi/sendCode';
    Map<String, dynamic> sendBody = {
      'mobile': phone,
      'type': 'login',
      'verify': code,
      'sessionid': sessionId,
    };
    dios.Dio dio = dios.Dio();
    dios.Response response = await dio.post(url, data: sendBody);
    if (response.data['status'] == 1) {
      Toast('发送成功');
      c.isSend.value = true;
    } else
      Toast('发送失败');
  }

}
