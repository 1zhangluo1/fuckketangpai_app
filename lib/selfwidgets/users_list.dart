import 'package:flutter/material.dart';
import 'package:fuckketangpai/models/local_users/local_users.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key,required this.users});
  
  final List<Users> users;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft ,child: Text('过期用户',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.users.length,
                  itemBuilder: (context,index) {
                    return ListTile(
                      title: Text(widget.users[index].name),
                      leading: Icon(Icons.error_outlined,color: Colors.red,),
                      trailing: TextButton(onPressed: () {}, child: Text('更新账户')),
                    );
                  }
              ),
            ),
            Align(alignment: Alignment.bottomRight,child: Text('我知道了'))
          ],
        ),
      ),
    );
  }
}
