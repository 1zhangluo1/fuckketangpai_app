import 'package:permission_handler/permission_handler.dart';

Future<bool> checkStoragePermission() async {
  // 检查是否有存储的读写权限
  if (await Permission.storage.isGranted) {
    return true; // 已经有存储的读写权限
  } else {
    // 请求存储的读写权限
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      return true; // 用户授予了权限
    } else {
      return false; // 用户拒绝或权限被永久拒绝
    }
  }
}
