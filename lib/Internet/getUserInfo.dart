import 'package:dio/dio.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/getUserInfos/getUserInfos.dart';
import 'package:fuckketangpai/models/userInfo.dart';
import 'package:fuckketangpai/pages/scan.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> getUserInf() async {
  String url1 = 'https://openapiv5.ketangpai.com//UserApi/getUserBasinInfo';
  String url2 = 'https://openapiv5.ketangpai.com//UserApi/getUserInfo';
  int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
  Map<String, int> body = {'reqtimestamp': reqtimestamp};
  Dio dio = Dio();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = await pref.getString('token') ?? '';
  Global.myToken = token;
  dio.options.headers = {
    'token': token,
  };
  Response response1 = await dio.post(url2, data: body);
  Response response2 = await dio.post(url1, data: body);
  dynamic temp = response1.data;
  GetUserInfos info = GetUserInfos.fromJson(temp);
  Global.user.value = User(
    info.data.username,
    info.data.stno,
    info.data.uid,
    info.data.avatar,
    response2.data['data']['mobile'] ?? "Null",
    info.data.school,
    info.data.usertype,
    info.data.additionInfo.grade,
    info.data.additionInfo.enrolltime,
    "",
  );
  Global.users.list.add(Global.user.value);
  print(Global.user.value.toString());

  //getUserInfByToken(Global.tokens[0]);
  for (int i = 0; i < Global.tokens.length; i++)
    await getUserInfByToken(Global.tokens[i]);
}

Future<void> getUserInfByToken(String token) async {
  String url1 = 'https://openapiv5.ketangpai.com//UserApi/getUserBasinInfo';
  String url2 = 'https://openapiv5.ketangpai.com//UserApi/getUserInfo';
  int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
  Map<String, int> body = {'reqtimestamp': reqtimestamp};
  Dio dio = Dio();
  //SharedPreferences pref = await SharedPreferences.getInstance();
  // String token = await pref.getString('token') ?? '';
  dio.options.headers = {
    'token': token,
  };
  Response response1 = await dio.post(url2, data: body);
  Response response2 = await dio.post(url1, data: body);
  dynamic temp = response1.data;
  GetUserInfos info = GetUserInfos.fromJson(temp);
  var uu = User(
    info.data.username,
    info.data.stno,
    info.data.uid,
    info.data.avatar,
    response2.data['data']['mobile'] ?? "Null",
    info.data.school,
    info.data.usertype,
    info.data.additionInfo.grade,
    info.data.additionInfo.enrolltime,
    "",
  );
  Global.users.list.add(uu);
  print(uu);
}

Future<void> getUserCoursesByToken(String token) async {
  String url1 = 'https://openapiv5.ketangpai.com/CourseApi/semesterList';
  String url2 = 'https://openapiv5.ketangpai.com//CourseApi/semesterCourseList';
  int reqtimestamp = DateTime.now().millisecondsSinceEpoch;
  Map<String, dynamic> body = {
    "isstudy": "1",
    "search": "",
    "reqtimestamp": reqtimestamp
  };
  Dio dio = Dio();

  dio.options.headers = {
    'token': token,
  };
  Response response1 = await dio.post(url1, data: body);

  var res = response1.data;
  var semesters = res['data']['semester'];
  body.clear();

  for (int i = 0; i < semesters.length; i++) {
    Semester s = Semester();
    s.semester = "${semesters[i]['semester']}";
    s.term = "${semesters[i]['term']}";
    s.termTxt = "${semesters[i]['termTxt']}";
    s.title = "${s.semester}(${s.termTxt})";

    reqtimestamp = DateTime.now().millisecondsSinceEpoch;
    body = {
      "isstudy": "1",
      "search": "",
      "semester": s.semester,
      "term": s.term,
      "reqtimestamp": reqtimestamp
    };

    response1 = await dio.post(url2, data: body);
    var list = response1.data['data'];
    for (int i = 0; i < list.length; i++) {
      Course c = Course();
      c.title = list[i]['coursename'];
      c.teacherName = list[i]['username'];
      c.studentCount = list[i]['total'];
      s.courses.add(c);
    }

    Global.semesters.list.add(s);
  }
}
