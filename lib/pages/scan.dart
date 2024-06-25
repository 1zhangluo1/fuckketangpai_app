import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kt_dart/kt.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:vibration/vibration.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  bool hasCustomVibrationsSupport = false;
  bool isFlash = false;
  MobileScannerController controller = MobileScannerController(detectionSpeed: DetectionSpeed.unrestricted,formats: [BarcodeFormat.all]);

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  initAsync() async {
    (await Vibration.hasCustomVibrationsSupport())?.let((it) {
      hasCustomVibrationsSupport = it;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                controller.toggleTorch();
                setState(() {
                  isFlash = !isFlash;
                });
              },
              icon: Icon(
                  isFlash ? Icons.flash_off_outlined : Icons.flash_on_outlined))
        ],
        title: Text("扫码"),
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: (capture) async {
          controller.stop();

          if (hasCustomVibrationsSupport) {
            Vibration.vibrate(duration: 100);
          } else {
            Vibration.vibrate();
          }
          // Play sound
          await Future.delayed(Duration(milliseconds: 100));
          // Vibrate

          // Use Get.back() to return the scanned result
          Get.back(result: capture);
        },
        overlayBuilder: (BuildContext context, BoxConstraints constraints) => Positioned(
          child: ScannerBox(width: 300, height: 300),
        ),
      ),
    );
  }
}

class ScannerBox extends StatefulWidget {
  final double width;
  final double height;

  const ScannerBox({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  State<ScannerBox> createState() => _ScannerBoxState();
}

class _ScannerBoxState extends State<ScannerBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: widget.height)
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: CustomPaint(
        painter: ScannerBoxPainter(_animation.value),
      ),
    );
  }
}

class ScannerBoxPainter extends CustomPainter {
  final double position;
  final double borderRadius;
  final List<Color> gradientColors;

  ScannerBoxPainter(this.position,
      {this.borderRadius = 8.0,
        this.gradientColors = const [Colors.blue, Colors.lightBlueAccent]});

  @override
  void paint(Canvas canvas, Size size) {
    // 创建渐变画笔
    final gradient = LinearGradient(
      colors: gradientColors,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    // 绘制边框
    final borderPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRRect(rrect, borderPaint);

    // 绘制渐变雷达线
    final linePaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // 由于雷达线是水平移动的，我们调整其Y坐标来模拟移动效果
    canvas.drawLine(
        Offset(0, position), Offset(size.width, position), linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // 由于动画改变了位置，我们希望它定期重绘
  }
}