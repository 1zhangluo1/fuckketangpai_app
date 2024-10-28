import 'package:flutter/material.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:get/get.dart';

import '../../selfwidgets/Toast.dart';

class ScanSign extends StatefulWidget {
  const ScanSign({super.key});

  @override
  State<ScanSign> createState() => _ScanSignState();
}

class _ScanSignState extends State<ScanSign> {

  ScanKitController controller = ScanKitController();
  final boxSize = 300.0;

  @override
  void initState() {
    super.initState();
    controller.onResult.listen((result) {
      Get.back(result: result.originalValue);
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
    var flash = false.obs;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // 设置 AppBar 上图标的颜色为白色
        ),
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: Colors.white, // 设置标题文字颜色为白色
          fontSize: 20, // 可以在这里设置字体大小
          fontWeight: FontWeight.bold, // 设置字体加粗
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                controller.switchLight();
                flash.value = !flash.value;
              },
              icon: Obx(
                    () => Icon(
                  flash.value ? Icons.flash_off_outlined : Icons.flash_on_outlined,
                  color: Colors.white,
                  size: 28,
                ),
              )),
        ],
        title: Text("扫码"),
      ),
      body: Stack(
        children: [
          ScanKitWidget(
              controller: controller,
              continuouslyScan: false,
              boundingBox: rect
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: Colors.blueAccent, width: 2),
                    right: BorderSide(color: Colors.blueAccent, width: 2),
                    top: BorderSide(color: Colors.blueAccent, width: 2),
                    bottom: BorderSide(color: Colors.blueAccent, width: 2)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
