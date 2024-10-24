import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/add_user/add_user_controller.dart';
import 'package:get/get.dart';

class AddWithAccount extends StatelessWidget {
  const AddWithAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(AddUserController());
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: c.accountLoginKey,
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
                controller: c.accountController,
                decoration: InputDecoration(
                  focusColor: Colors.blueAccent[100],
                  labelText: '账号',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : '账号不能为空';
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: TextFormField(
                obscureText: true,
                controller: c.passwordController,
                decoration: InputDecoration(
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
                    if ((c.accountLoginKey.currentState as FormState).validate()) {
                      c.addUserByAccount(context);
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
}
