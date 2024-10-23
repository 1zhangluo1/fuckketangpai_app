import 'package:flutter/material.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/pages/add_user/add_user_page.dart';
import 'package:fuckketangpai/pages/private_sign_room/private_sign_controller.dart';
import 'package:fuckketangpai/tools/sign.dart';
import 'package:get/get.dart';

class PrivateSignPage extends StatefulWidget {
  const PrivateSignPage({super.key});

  @override
  State<PrivateSignPage> createState() => _PrivateSignPageState();
}

class _PrivateSignPageState extends State<PrivateSignPage> {
  final c = Get.put(PrivateSignController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          child: Icon(Icons.add),
          onPressed: () => Get.to(AddUserPage())
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final signValue = await c.showSignWay(context);
                  for (var user in c.users) {
                    bool result = await sign(signValue, user.token);
                    print("签到结果：" + result.toString());
                    user.signStatus = result;
                  }
                  c.users.forEach((e)=>print("签到结果后的状态：" + e.signStatus.toString()));
                  Get.forceAppUpdate();
                },
                child: Text('签到'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: () => c.refreshData(),
                  child: ListView(
                    children: _buildList(c.users),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildList(List<Users> users) {
    List<Widget> widgets = [];
    users.forEach((user) {
      widgets.add(_generateExpansionTileWidget(user));
    });
    return widgets;
  }

  /// 生成 ExpansionTile 组件 , children 是 List<Widget> 组件
  Widget _generateExpansionTileWidget(Users user) {
    return ExpansionTile(
      title: Text(
        user.name,
        style: TextStyle(color: Colors.black54, fontSize: 20),
      ),
      children: [_generateWidget(user)],
    );
  }

  /// 生成 ExpansionTile 下的 ListView 的单个组件
  Widget _generateWidget(Users user) {
    final textStyle = TextStyle(fontSize: 16);

    /// 使用该组件可以使宽度撑满
    return FractionallySizedBox(
        widthFactor: 1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '进行中课程',
                    style: textStyle,
                  ),
                  Text(
                    user.isCourse,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '签到状态',
                    style: textStyle,
                  ),
                  Text(
                    user.signStatus.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: user.signStatus ? Colors.green : Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
