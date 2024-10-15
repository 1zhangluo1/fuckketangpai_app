import 'package:flutter/material.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:get/get.dart';

class Profiles extends StatefulWidget {
  const Profiles({super.key});

  @override
  State<Profiles> createState() => _ProfilesState();
}

// class UserProfile extends StatefulWidget {
//   @override
//   _ProfilesState createState() => _ProfilesState();
// }

class _ProfilesState extends State<Profiles> {
  // 控制折叠菜单是否展开的变量
  var _isExpandedList = <bool>[].obs; // 使用 RxList
  @override
  void initState() {
    super.initState();
    // 根据用户信息的长度初始化展开状态列表
    // _isExpandedList = List<bool>.filled(Global.users.value.list.length, false);
    _isExpandedList
        .assignAll(List.filled(100, false));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          // decoration: BoxDecoration(
          //   //color: Color.fromARGB(221, 179, 52, 52),
          //   border: Border.all(
          //     color: const Color.fromARGB(136, 122, 119, 119), // 边框颜色
          //     width: 2.0, // 边框宽度
          //   ),
          //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
          // ),
          height: MediaQuery.of(context).size.height * 0.4, // 设置一个固定高度
          child: SingleChildScrollView(
            child: Obx(() => ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    // 当点击时，切换展开状态

                    setState(() {
                      _isExpandedList[index] = isExpanded;
                    });
                  },
                  children:
                      List.generate(Global.users.list.length, (index) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(
                              '${Global.users.list[index].name} 签到:${Global.users.list[index].signState}'),
                          //tileColor: Color.fromARGB(255, 100, 99, 99),
                        );
                      },
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          line('姓名', Global.users.list[index].name),
                          line('学号', Global.users.list[index].id),
                          line('手机号', Global.users.list[index].phone),
                          line('学校', Global.users.list[index].school),
                          line(
                              '身份',
                              Global.users.list[index].identity == '0'
                                  ? '学生'
                                  : ''),
                          line('签到状态',Global.users.list[index].signState),
                        ],
                      ),
                      isExpanded: _isExpandedList[index], // 根据当前的展开状态显示内容
                      canTapOnHeader: true, // 允许点击标题部分展开
                    );
                  }),
                )),
          ),
        ));
  }

  Widget line(String label, String info) {
    return ListTile(
      title: Text(label),
      trailing: Text(
        info,
        textScaleFactor: 1.5,
      ),
    );
  }
}
