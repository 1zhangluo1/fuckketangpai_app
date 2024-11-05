import 'package:flutter/material.dart';
import 'package:fuckketangpai/models/userInfo.dart';
import 'package:fuckketangpai/pages/login/login_page.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/static.dart';


class DrawerMenu extends StatefulWidget {
  const DrawerMenu(this.pageController);

  final PageController pageController;

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 5,
                color: Colors.lightBlueAccent[100],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Image.network(
                          Global.user.value.headImageuri,
                          fit: BoxFit.contain,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return ClipOval(
                              child: Icon(
                                Icons.person,
                                size: 35,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Global.user.value.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            Global.user.value.identity == '0' ? '学生' : '老师',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                height: 1,
                width: double.infinity,
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.person_outlined),
                title: Text('个人信息'),
                onTap: () {
                  widget.pageController.jumpToPage(0);
                  Scaffold.of(context).closeDrawer();
                  print('个人信息');
                },
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.house_outlined),
                title: Text('共享房间'),
                onTap: () {
                  widget.pageController.jumpToPage(1);
                  Scaffold.of(context).closeDrawer();
                  print('共享签到房间');
                },
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.house_outlined),
                title: Text('本地房间签到'),
                onTap: () {
                  widget.pageController.jumpToPage(2);
                  Scaffold.of(context).closeDrawer();
                  print('本地房间签到');
                },
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.class_outlined),
                title: Text('我的课程'),
                onTap: () {
                  widget.pageController.jumpToPage(3);
                  Scaffold.of(context).closeDrawer();
                  print('我的课程列表');
                },
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text('意见反馈'),
                onTap: () {
                  widget.pageController.jumpToPage(4);
                  Scaffold.of(context).closeDrawer();
                  print('意见反馈');
                },
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app_outlined),
                title: Text('退出登录'),
                onTap: () {
                  exitLogin(context);
                },
              ),
              SizedBox(
                height: 15,
              ),
            ],
          )),
    );
  }

  Future<void> exitLogin(BuildContext context) async {
     bool? verify = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('你确定退出登录吗',style: TextStyle(fontSize: 18),),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context,false),
                  child: Text('取消')
              ),
              TextButton(
                  onPressed: () => Navigator.pop(context,true),
                  child: Text('确定')
              ),
            ],
          );
        }
    );
    if (verify ?? false) {
      try {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.clear();
        Global.user.value = User('', '', '', '', '', '', '','','','');
        Global.login = false;
        Get.offAll(Login());
        Toast('退出成功');
      } on Exception catch (e) {
        Toast('退出遇到了一点意外:' + e.toString());
      }
    }
  }

}
