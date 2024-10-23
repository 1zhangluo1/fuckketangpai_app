import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/add_user/add_with_account.dart';
import 'package:fuckketangpai/pages/add_user/add_with_phone.dart';
import 'package:fuckketangpai/selfwidgets/keep_alive_wrapper.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> with SingleTickerProviderStateMixin{

  late TabController tabController;
  List tabs = ["账号密码", "手机验证码"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('添加用户'),
        bottom: TabBar(
            tabs: tabs.map((e) => Tab(text: e)).toList(),
            controller: tabController,
            labelColor: Colors.blue[400],
            indicatorColor: Colors.blue[400],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          KeepAliveWrapper(child: AddWithAccount()),
          KeepAliveWrapper(child: AddWithPhone()),
        ],
      )
    );
  }
}
