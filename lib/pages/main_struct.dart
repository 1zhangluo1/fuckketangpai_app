import 'package:flutter/material.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/pages/Detail_Profile.dart';
import 'package:fuckketangpai/pages/Drawer_menu.dart';
import 'package:fuckketangpai/pages/Rooms_list.dart';
import 'package:fuckketangpai/pages/My_classes.dart';
import 'package:fuckketangpai/pages/upload_suggest.dart';
import 'package:get/get.dart';

class MainStruct extends StatefulWidget {
  const MainStruct({super.key});

  @override
  State<MainStruct> createState() => _MainStructState();
}

class _MainStructState extends State<MainStruct> {
  final pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(pageController),
      appBar: AppBar(
        leadingWidth: 65,
        actions: [
          IconButton(
            onPressed: () {
              print('这是搜索房间功能');
            },
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            iconSize: 35,
          )
        ],
        backgroundColor: Colors.blue[200],
        surfaceTintColor: Colors.purple,
        title: Text(
          '课堂派',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        leading: Builder(builder: (context) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Obx(
                () => ClipOval(
                  child: Image.network(
                    Global.user.value.headImageuri,
                    fit: BoxFit.cover,
                    width: 100.0, // 容器宽度
                    height: 100.0, // 容器高度
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
              ),
            ),
          );
        }),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          DetailProfileInfo(),
          Shared_sign_room(),
          MyClasses(),
          SendSuggestions(),
        ],
      ),
    );
  }
}
