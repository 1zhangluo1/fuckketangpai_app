import 'package:flutter/material.dart';
import 'package:fuckketangpai/pages/home.dart';

class Shared_sign_room extends StatefulWidget {
  const Shared_sign_room({super.key});

  @override
  State<Shared_sign_room> createState() => _Shared_sign_roomState();
}

class _Shared_sign_roomState extends State<Shared_sign_room> {
  @override
  Widget build(BuildContext context) {
    return QrScan();
  }
}
