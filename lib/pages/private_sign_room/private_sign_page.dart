import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';
import 'package:fuckketangpai/models/online_courses/online_courses.dart';
import 'package:fuckketangpai/pages/add_user/add_user_page.dart';
import 'package:fuckketangpai/pages/private_sign_room/private_sign_controller.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/selfwidgets/confirm_dialog.dart';
import 'package:fuckketangpai/selfwidgets/introduce_dialog.dart';
import 'package:fuckketangpai/service/sign.dart';
import 'package:fuckketangpai/strings.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/courses_list/courses_list.dart';
import '../../tools/uitils.dart';

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
          onPressed: () => Get.to(AddUserPage())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: () async {
            await c.refreshUserData();
            await c.refreshCoursesData();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final signValue = await c.showSignWay(context);
                      if (signValue != '') {
                        await c.signSelectablePeople(signValue);
                      }
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code_scanner_outlined),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '扫码签到',
                            style: TextStyle(letterSpacing: 2),
                          ),
                        ]),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                  child: Text(
                '正在签到课程：',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5,
                ),
              ),
              Obx(
                () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: c.signingCourses.length,
                    (_, index) => signingCourse(c.signingCourses[index]),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('本地签到用户：', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      TextButton(onPressed: () => c.selectAllPeople(), child: Text('全选'))
                    ],
                  )),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5,
                ),
              ),
              Obx(
                () => SliverList(
                  delegate: SliverChildBuilderDelegate(
                      childCount: c.users.length,
                      (_, index) => _buildList(c.users)[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget signingCourse(Course course) {
    return ListTile(
      title: Text(course.coursename),
      subtitle: Text(course.username),
      trailing: ElevatedButton(
          onPressed: () {
            c.enterSignRoom(course.signType, context,signId: course.signId);
            Get.forceAppUpdate();
          },
          child: Text(mapperSignWay(course.signType))),
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
      title: Row(
        children: [
          Checkbox(
              value: user.isCheck,
              onChanged: (result) {
                setState(() {
                  user.isCheck = result ?? false;
                });
              }),
          SizedBox(
            width: 10,
          ),
          Text(
            user.name,
            style: TextStyle(color: Colors.black54, fontSize: 20),
          ),
          SizedBox(
            width: 10,
          ),
          user.tokenStatus ? SizedBox() : Icon(
            Icons.error_outlined,
            color: Colors.red,
          )
        ],
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
                  Row(
                    children: [
                      Text(
                        '账号状态是否过期',
                        style: textStyle,
                      ),
                      IconButton(
                          onPressed: () async {
                            IntroduceDialog.showLoadingDialog(context: context, title: '帐号状态说明', content: Strings.accountStatusIntroduce);
                          },
                          icon: SvgPicture.asset('images/question.svg',width: 28,height: 28,)
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        user.tokenStatus.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: user.tokenStatus ? Colors.green : Colors.red),
                      ),
                      IconButton(
                          onPressed: () async {
                            user.tokenStatus = await c.checkUserAccountStatus(user.token);
                            Get.forceAppUpdate();
                          },
                          icon: Icon(Icons.refresh_outlined)
                      )
                    ],
                  )

                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '电话号码',
                    style: textStyle,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: user.phone.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            decorationThickness: 1.5,
                            decorationColor: Colors.lightBlue,
                            color: Colors.lightBlue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final confirm = await showDialog<bool>(
                                context: context,
                                builder: (context) => ConfirmDialog(content: "确定要拨打这个电话吗",));
                            if (confirm != null && confirm) {
                              launch("tel:${user.phone.toString()}");
                            } else if (confirm == null) {
                              Toast('错误');
                            }
                          })
                  ])),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                        onPressed: () => Get.to(AddUserPage()),
                        icon: Icon(Icons.update_outlined,color: Colors.white,),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                        label: Text('更新用户',style: TextStyle(color: Colors.white),)
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                        onPressed: () async {
                          final confirm = await showDialog<bool>(context: context, builder: (context) {
                            return ConfirmDialog(content: '确认删除此用户吗');
                          });
                          if (confirm ?? false) {
                            await c.deleteSelectedUser(user, context);
                            Get.forceAppUpdate();
                          }
                        },
                        icon: Icon(Icons.delete_forever_outlined,color: Colors.white,),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        label: Text('删除用户',style: TextStyle(color: Colors.white),)
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
