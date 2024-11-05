import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:fuckketangpai/gen/assets.gen.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/pages/login/password_login.dart';
import 'package:fuckketangpai/pages/login/phone_login.dart';
import 'package:fuckketangpai/pages/Sign_Room.dart';
import 'package:fuckketangpai/pages/main_struct.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/service/add_user_to_json.dart';
import 'package:fuckketangpai/tools/encrypt_loginpass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../Internet/getUserInfo.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  GlobalKey phone_login_key = GlobalKey<FormState>();
  GlobalKey validLogin = GlobalKey<FormState>();
  var isLogin = false.obs;
  TextEditingController phoneController = TextEditingController();
  TextEditingController validController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void isSkipLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogin = pref.getBool('login') ?? false;
    if (isLogin) {
      Get.to(SharedSignRoom());
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '登录',
          style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(Assets.images.ketangpaiLogo.path),
            SizedBox(
              height: 20,
            ),
            Text(
              'FUCKKETANGPAI',
              textScaleFactor: 2.5,
              style: TextStyle(
                  color: Colors.blue[200], fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: Colors.white,
                surfaceTintColor: Colors.blueAccent[100],
                elevation: 10,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.blue[400],
                        indicatorColor: Colors.blue[400],
                        tabs: [
                          Tab(
                            text: '密码登录',
                          ),
                          Tab(
                            text: '短信登录',
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 230,
                      child: TabBarView(
                        children: [
                          PasswordLogin(
                            accountController: accountController,
                            passwordController: passwordController,
                            validLogin: validLogin,
                          ),
                          PhoneLogin(
                            phone_login_key: phone_login_key,
                            phoneController: phoneController,
                            validController: validController,
                          ),
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlueAccent),
                      surfaceTintColor: MaterialStateProperty.all<Color>(
                          Colors.lightBlueAccent),
                    ),
                    onPressed: () async {
                      isLogin.value = true;
                      int currentStatus = _tabController.index;
                      if (currentStatus == 0 &&
                          (validLogin.currentState as FormState).validate()) {
                        await Login(
                            accountController.value.text,
                            passwordController.value.text,
                            '',
                            'https://openapiv5.ketangpai.com//UserApi/login');
                      } else if (currentStatus == 1 &&
                          (phone_login_key.currentState as FormState)
                              .validate()) {
                        await Login(
                            phoneController.value.text,
                            '',
                            validController.value.text,
                            'https://openapiv5.ketangpai.com//UserApi/loginByMobile');
                      }
                      isLogin.value = false;
                    },
                    child: Obx(
                      () => Text(
                        isLogin.value ? '登录中...' : '登录',
                        textScaleFactor: 1.4,
                        style: TextStyle(color: Colors.white,letterSpacing: 2),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> Login(
      String account, String password, String verifyCode, String url) async {
    String encryPass = encryptByCBC(
        password, Global.ketangpai_login_key, Global.ketangpai_login_iv);
    int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
    Map<String, dynamic> loginBody = {
      'mobile': account,
      'password': encryPass,
      'encryption': '1',
      'reqtimestamp': reqtimestamp,
      'email': account,
      'type': 'login',
      'remember': '0',
      'code': verifyCode,
    };
    // Map<String, dynamic> saveBody = {
    //   'name': '',
    //   'student_id': '',
    //   'school': '',
    //   'phone': '',
    // };
    try {
      dios.Dio dio = dios.Dio();
      dios.Response response = await dio.post(url, data: loginBody);
      if (response.data['status'] == 1) {
        final token = response.data['data']['token'];
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('token', token);
        pref.setBool('login', true);
        Global.myToken = token;
        await initUserInf(token);
        Toast('登录成功');
        final userInfo = Global.user.value;
        final user = Users(name: userInfo.name, account: account, password: password, signStatus: false, isCourse: '无', token: token, uid: userInfo.uid, phone: userInfo.phone);
        int result = await saveToJson(user);
        if (result == 0) {
          Toast('成功添加新用户');
        }
        // Map<String, dynamic> saveBody = {
        //   'name': Global.user.value.name,
        //   'student_id': Global.user.value.id,
        //   'school': Global.user.value.school,
        //   'phone': Global.user.value.phone,
        // };
        Get.offAll(MainStruct());
      } else {
        print(response.data.toString());
        Toast('登录失败');
      }
    } on Exception catch (e) {
      print('连接失败' + e.toString());
      Toast(e.toString());
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
