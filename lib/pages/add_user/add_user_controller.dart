import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/selfwidgets/loading_dialog.dart';
import 'package:get/get.dart';
import '../../Internet/getUserInfo.dart';
import '../../global/static.dart';
import '../../selfwidgets/Toast.dart';
import '../../service/edit_user_to_json.dart';
import '../../tools/encrypt_loginpass.dart';

class AddUserController extends GetxController {

  final accountController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final validCodeController = TextEditingController();
  GlobalKey phoneLoginKey = GlobalKey<FormState>();
  GlobalKey accountLoginKey = GlobalKey<FormState>();
  var isSend = false.obs;

  Future<Users?> getUserInfo(
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
    try {
      dios.Dio dio = dios.Dio();
      dios.Response response = await dio.post(url, data: loginBody);
      if (response.data['status'] == 1) {
        final token = response.data['data']['token'];
        final userInfo = await getUserInfByToken(token);
        final user = Users(name: userInfo.name, account: account, password: password, signStatus: false, isCourse: '无', token: token, uid: userInfo.uid, phone: userInfo.phone);
        return user;
      } else {
        print(response.data.toString());
        Toast(response.data['message']);
      }
    } on Exception catch (e) {
      Toast(e.toString());
    }
  }

  Future addUserByAccount(BuildContext context) async {
    LoadingDialog.showLoadingDialog(context: context, hintText: '添加中...');
    final user = await getUserInfo(accountController.text.trim(), passwordController.text.trim(), validCodeController.text.trim(), 'https://openapiv5.ketangpai.com//UserApi/login');
    if (user != null) {
      int result = await saveToJson(user);
      LoadingDialog.hideDialog(context: context);
      if (result == 1) {
        Toast('添加成功');
      } else if (result == 0) {
        Toast('用户已存在');
      } else if (result == -1) {
        Toast('添加失败');
      }
    } else {
      LoadingDialog.hideDialog(context: context);
      Toast('添加失败');
    }
  }

  Future addUserByPhone(BuildContext context) async {
    LoadingDialog.showLoadingDialog(context: context, hintText: '添加中...');
    final user = await getUserInfo(phoneController.text.trim(), '', validCodeController.text.trim(), 'https://openapiv5.ketangpai.com//UserApi/loginByMobile');
    if (user != null) {
      int result = await saveToJson(user);
      LoadingDialog.hideDialog(context: context);
      if (result == 1) {
        Toast('添加成功');
      } else if (result == 0) {
        Toast('用户已存在');
      } else if (result == -1) {
        Toast('添加失败');
      }
    } else {
      LoadingDialog.hideDialog(context: context);
      Toast('添加失败');
    }
  }

}