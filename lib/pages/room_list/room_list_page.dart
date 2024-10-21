import 'package:flutter/material.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({super.key});

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('房间列表'),
      ),
      body: ListView.builder(
          itemBuilder: (context,index) {
            return ListTile(
              title: Text('$index'),
            );
          }
      ),
    );
  }
}
