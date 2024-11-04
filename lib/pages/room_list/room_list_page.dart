import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/course_sign_status/sign_status_page.dart';
import 'package:fuckketangpai/pages/room_list/room_list_controller.dart';
import 'package:fuckketangpai/pages/shared_sign_room/shared_room_page.dart';
import 'package:get/get.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({super.key});

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  RoomListController roomListController = Get.put(RoomListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的房间列表'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: () => roomListController.initRoom(),
          child: Obx(
            () => ListView.separated(
                itemBuilder: (context, index) {
                  final course = roomListController.courses[index];
                  return ListTile(
                    onTap: () => Get.to(SignStatusPage(),arguments: course.id),
                    leading: Icon(
                      Icons.live_tv_outlined,
                      color: course.teaching ? Colors.green : Colors.grey,
                    ),
                    title: Text(
                      course.coursename,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      course.teaching ? '正在上课' : '未上课',
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  );
                },
                itemCount: roomListController.courses.length,
                separatorBuilder: (context, index) {
                  return Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 0.5,
                  );
                },
              ),
          ),
          ),
        ),
    );
  }
}
