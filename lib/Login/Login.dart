import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:fuckketangpai/GetInformation/getUserInfo.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/pages/home.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/tools/encrypt_loginpass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey validLogin = GlobalKey<FormState>();
  void isSkipLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogin = pref.getBool('login')??false;
    if(isLogin) {
      Get.to(QrScan());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Card(
              color: Colors.white,
              surfaceTintColor: Colors.blueAccent[100],
              elevation: 10,
              child: Form(
                key: validLogin,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: accountController,
                          decoration: InputDecoration(
                            focusColor: Colors.blueAccent[100],
                            icon: Icon(Icons.phone),
                            iconColor: Colors.blueAccent,
                            labelText: '电话号码',
                          ),
                          validator: (v) {
                            return v!.trim().length == 11 ? null : '电话号码不符合格式';
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 50),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.password),
                            iconColor: Colors.blueAccent,
                            labelText: '密码',
                          ),
                          validator: (v) {
                            return v!.trim().isEmpty ? '密码不能为空' : null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if ((validLogin.currentState as FormState).validate()) {
                      accountLogin(accountController.value.text, passwordController.value.text);
                    }
                  },
                  child: Text('登录'),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> accountLogin (String account,String password) async {
    String url = 'https://openapiv5.ketangpai.com//UserApi/login';
    String encryPass = encryptByCBC(password, Global.ketangpai_login_key, Global.ketangpai_login_iv);
    int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
    Map<String,dynamic> loginBody = {
      'mobile': account,
      'password': encryPass,
      'encryption': '1',
      'reqtimestamp': reqtimestamp,
      'email': account,
      'type': 'login',
      'remember': '0',
    };
    try {
      dios.Dio dio = dios.Dio();
      dios.Response response = await dio.post(url,data: loginBody);
      if (response.data['status'] == 1) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('token', response.data['data']['token']);
        pref.setBool('login', true);
        await getUserInf();
        Toast('登录成功');
        Get.to(QrScan());
      } else {
        Toast('登录失败');
      }
    } on Exception catch (e) {
      Toast(e.toString());
    }
  }

}
