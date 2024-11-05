import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordLogin extends StatefulWidget {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey validLogin;

  PasswordLogin({
    required this.accountController,
    required this.passwordController,
    required this.validLogin,
  });

  @override
  State<PasswordLogin> createState() => _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: widget.validLogin,
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
                  controller: widget.accountController,
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
              child: Container(
                width: double.infinity,
                child: TextFormField(
                  obscureText: true,
                  controller: widget.passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    iconColor: Colors.blueAccent,
                    labelText: '密码',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (v) {
                    return v!.trim().isEmpty ? '密码不能为空' : null;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
