import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/room_list/room_list_controller.dart';
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
      body: Obx(
          () => ListView.separated(
            itemBuilder: (context, index) {
          return ListTile(
              title: Text(roomListController.courses[index].coursename),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
          );
        },
          itemCount: roomListController.courses.length,
          separatorBuilder: (context,index) {
              return Container(
                color: Colors.grey,
                width: double.infinity,
                height: 0.5,
              );
          },
        ),
      ),
    );
  }

}
