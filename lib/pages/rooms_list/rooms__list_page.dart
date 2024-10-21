import 'package:flutter/material.dart';

class RoomsListPage extends StatefulWidget {
  const RoomsListPage({super.key});

  @override
  State<RoomsListPage> createState() => _RoomsListPageState();
}

class _RoomsListPageState extends State<RoomsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('课程房间列表'),
      ),
      body: ListView.builder(
          itemBuilder: (context,index) {
            return ListTile(
              title: Text('课程名称'),
            );
          }
      ),
    );
  }
}
