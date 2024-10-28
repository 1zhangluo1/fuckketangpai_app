import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';
import 'package:fuckketangpai/selfwidgets/loading_dialog.dart';

const boxSize = 200.0;

class SendSuggestions extends StatefulWidget {
  const SendSuggestions({super.key});

  @override
  State<SendSuggestions> createState() => _SendSuggestionsState();
}

class _SendSuggestionsState extends State<SendSuggestions> {

  ScanKitController controller = ScanKitController();

  @override
  void initState() {
    super.initState();
    controller.onResult.listen((result) {
      Toast(result.originalValue);
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var left = screenWidth / 2 - boxSize / 2;
    var top = screenHeight / 2 - boxSize / 2;
    var rect = Rect.fromLTWH(left, top, boxSize, boxSize);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ScanKitWidget(
                controller: controller,
                continuouslyScan: false,
                boundingBox: rect),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        controller.switchLight();
                      },
                      icon: Icon(
                        Icons.lightbulb_outline_rounded,
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        controller.pickPhoto();
                      },
                      icon: Icon(
                        Icons.picture_in_picture_rounded,
                        color: Colors.white,
                        size: 28,
                      ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Colors.orangeAccent, width: 2),
                      right: BorderSide(color: Colors.orangeAccent, width: 2),
                      top: BorderSide(color: Colors.orangeAccent, width: 2),
                      bottom: BorderSide(color: Colors.orangeAccent, width: 2)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
