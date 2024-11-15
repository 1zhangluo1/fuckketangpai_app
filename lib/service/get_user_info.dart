import 'package:fuckketangpai/Internet/network.dart';
import 'package:fuckketangpai/selfwidgets/Toast.dart';

class GetUserInfo {

  final dio = AppNetwork.get().ketangpaiDio;

  Future<bool> checkTokenStatus(String token) async {
    int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
    Map<String, int> body = {'reqtimestamp': reqtimestamp};
    final dio = AppNetwork.get().ketangpaiDio;
    dio.options.headers = {
      'token': token,
    };
    final response = await dio.post('/UserApi/getUserBasinInfo', data: body);
    print(response.data['data']['token']);
    if (response.data['data']['token'] == null) {
      return false;
    }
    return true;
  }

  GetUserInfo._create();

  static GetUserInfo? _instance;

  factory GetUserInfo.get() => GetUserInfo._instance ??= GetUserInfo._create();

}