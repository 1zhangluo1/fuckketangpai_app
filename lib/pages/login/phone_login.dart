import 'dart:typed_data';
import 'package:fuckketangpai/selfwidgets/TimeCountDown.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/tools/randoms_tring.dart';

class phone_login extends StatefulWidget {
  GlobalKey phone_login_key;
  TextEditingController phoneController;
  TextEditingController validController;

  phone_login({
    required this.phone_login_key,
    required this.phoneController,
    required this.validController,
  });

  @override
  State<phone_login> createState() => _phone_loginState();
}

class _phone_loginState extends State<phone_login>
    with AutomaticKeepAliveClientMixin {
  late String sessionId;
  final verifyKey = GlobalKey<FormFieldState>();
  final verifyCodeController = TextEditingController();
  RxBool isSend = false.obs;

  @override
  void initState() {
    super.initState();
    sessionId = generateRandomString();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: widget.phone_login_key,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
              child: Container(
                width: double.infinity,
                child: TextFormField(
                  key: verifyKey,
                  controller: widget.phoneController,
                  decoration: InputDecoration(
                    focusColor: Colors.blueAccent[100],
                    icon: Icon(Icons.phone),
                    iconColor: Colors.blueAccent,
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
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: widget.validController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.verified),
                        iconColor: Colors.blueAccent,
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
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  Obx(
                    () => isSend.value ? TimeCountDown(countdownTime: 60,timeEndFun: () {isSend.value = false;},) : ElevatedButton(
                      onPressed: () {
                        if (verifyKey.currentState?.validate() ?? false) {
                          getVerifyCode();
                        }
                      },
                      child: Text('发送验证码'),
                      style: ElevatedButton.styleFrom(
                          surfaceTintColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getVerifyCode() async {
    String url = 'https://openapiv5.ketangpai.com/UserApi/verify';
    try {
      dios.Dio dio = dios.Dio();
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
                controller: verifyCodeController,
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
                        widget.phoneController.value.text);
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
      isSend.value = true;
    } else
      Toast('发送失败');
  }

  @override
  bool get wantKeepAlive => true;

}
