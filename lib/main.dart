import 'package:flutter/material.dart';
import 'package:fuckketangpai/Login/Login.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/pages/home.dart';
import 'package:get/get.dart';


void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FuckKetangpai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent.shade100),
        useMaterial3: true,
      ),
      home: Global.login ? QrScan() : Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
