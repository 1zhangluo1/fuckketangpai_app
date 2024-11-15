import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppNetwork {
  static const String ketangpaiBaseUrl = "https://openapiv5.ketangpai.com";

  late Dio ketangpaiDio;

  // 私有构造函数
  AppNetwork._create() {
    ketangpaiDio = setupKetangpaiDio(Dio(), '');
  }

  // 单例实例
  static final AppNetwork _instance = AppNetwork._create();

  // 工厂构造函数
  factory AppNetwork.get() {
    return _instance;
  }

  static Dio setupKetangpaiDio(Dio dio, String token) {
    dio.options = BaseOptions(
      baseUrl: ketangpaiBaseUrl,
      headers: {"token": token},
      followRedirects: false,
      validateStatus: (int? status) => status != null,
    );
    return dio;
  }

  // 初始化网络配置
  static Future<void> initNetwork() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString('token') ?? '';
    if (token.isNotEmpty) {
      _instance.ketangpaiDio = setupKetangpaiDio(_instance.ketangpaiDio, token);
    }
  }
}
