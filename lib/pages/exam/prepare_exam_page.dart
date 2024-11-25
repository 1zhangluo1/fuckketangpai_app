import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fuckketangpai/global/static.dart';
import 'package:fuckketangpai/models/exam_info/exam_info.dart';
import 'package:fuckketangpai/selfwidgets/colored_container_text.dart';
import 'package:fuckketangpai/service/exam_data.dart';
import 'package:fuckketangpai/tools/uitils.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

class PrepareExamPage extends StatefulWidget {
  const PrepareExamPage({super.key, required this.courseId, required this.testPaperId});

  final String courseId;
  final String testPaperId;

  @override
  State<PrepareExamPage> createState() => _PrepareExamPageState();
}

class _PrepareExamPageState extends State<PrepareExamPage> {

  final examInfo = Testpaper.emptyInstance().obs;

  String testHtmlData = '''
        <h1>标题</h1>
    <p>这是一个段落 <b>加粗文本</b>。</p>
    <a href="https://example.com">这是一个链接</a>    <h1>标题</h1>
    <p>这是一个段落 <b>加粗文本</b>。</p>
    <a href="https://example.com">这是一个链接</a>    <h1>标题</h1>
    <p>这是一个段落 <b>加粗文本</b>。</p>
    <a href="https://example.com">这是一个链接</a>    <h1>标题</h1>
    <p>这是一个段落 <b>加粗文本</b>。</p>
    <a href="https://example.com">这是一个链接</a>
    ''';

  @override
  void initState() {
    super.initState();
    getPaperInfo(widget.courseId, widget.testPaperId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('考试内容'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => mapHintContainer(examInfo.value.submitStatus, examInfo.value.submitState)),
                  SizedBox(
                    height: 16,
                  ),
                  Obx( () => paperInfo()),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Obx(() => paperHostInfo()),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.fromLTRB(16,12,16,12),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text('开始答题',style: TextStyle(color: Colors.white,fontSize: 16,letterSpacing: 3),),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
  
  Widget paperHostInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(child: Image.network(
            examInfo.value.avatar,fit: BoxFit.cover,width: 30,height: 30,
            errorBuilder: (context,object,error) {
              return ClipOval(
                child: Container(
                  width: 30,
                  height: 30,
                ),
              );
            },
          ),),
          SizedBox(
            width: 10,
          ),
          Text(examInfo.value.nickname),
          SizedBox(
            width: 10,
          ),
          examInfo.value.createtime == '' ? SizedBox() : Text('发布于${(int.parse(examInfo.value.createtime).time)}',style: TextStyle(color: Colors.grey),)
        ],
      ),
    );
  }

  Widget paperInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              examInfo.value.over == "1" ? ColoredContainerText(text: '已结束', background: Colors.black, textSize: 13.0) :
              ColoredContainerText(text: '进行中', background: Colors.greenAccent, textSize: 13.0),
              SizedBox(
                width: 5,
              ),
              Text(examInfo.value.title,style: TextStyle(fontSize: 21),overflow: TextOverflow.ellipsis,)
            ],
          ),
          SizedBox(
            height: 30,
          ),
          ColoredContainerText(text: '起止: ${examInfo.value.begintime}~${examInfo.value.endtime.isEmpty ? "不限制" : examInfo.value.endtime}', background: Colors.blueAccent, textSize: 13),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              ColoredContainerText(text: examInfo.value.type == '0' ? '普通测试' : '考试', background: Colors.blueAccent, textSize: 13),
              SizedBox(
                width: 10,
              ),
              examInfo.value.lessonlink.isEmpty ? SizedBox(height: 0,) :
              Row(
                children: [
                  ColoredContainerText(text: "期末", background: Colors.grey, textColor: Colors.black, textSize: 13),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              ColoredContainerText(text: examInfo.value.timelength > 0 ? '${examInfo.value.timelength.toString()}分钟' : '不限时', background: Colors.grey, textColor: Colors.black, textSize: 13),
            ],
          ),
          examInfo.value.description == " " ? SizedBox() :
          Html(
            data: examInfo.value.description,
            shrinkWrap: true,
            style: Global.htmlStyle),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          SizedBox(
            height: 16,
          ),
          Text('本试卷共${examInfo.value.subjectCount.toString()}题',style: TextStyle(fontSize: 16,color: Colors.grey),)
        ],
      ),
    );
  }

  Widget failedSubmitContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(121, 234, 135, 73).withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.access_time_filled_outlined,color: Colors.deepOrange,size: 40,),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('未提交！',style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 18),),
                Text('您的试卷未提交，可以继续作答哦！',style: TextStyle(color: Colors.grey),)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget withScoreSubmitContainer() {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 114, 241, 184).withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.check_circle,color: Color.fromARGB(255, 42, 193, 125),size: 40,),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text('您的得分：${examInfo.value.score}/${examInfo.value.totalScore}',style: TextStyle(color: Color.fromARGB(255, 42, 193, 125),fontSize: 18),)),
                examInfo.value.submitState == 7 ? SizedBox() : Text('点击下方“查看试卷”可以查看作答情况',style: TextStyle(color: Colors.grey),)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget failedReviewContainer() {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 113, 187, 246).withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.check_circle,color: Colors.blueAccent,size: 40,),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('已提交，老师还未批改！',style: TextStyle(color: Colors.blueAccent,fontSize: 18),),
                examInfo.value.submitState == 7 ? SizedBox() : Text('点击下方“查看试卷”可以查看作答情况',style: TextStyle(color: Colors.grey),)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget withoutScoreContainer() {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(121, 234, 135, 73).withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.access_time_filled_outlined,color: Colors.deepOrange,size: 40,),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('成绩未公布，请您耐心等待！',style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 18),),
                Text('点击下方“查看试卷”可以查看作答情况',style: TextStyle(color: Colors.grey),)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget endedContainer() {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(121, 182, 182, 182).withOpacity(0.2)
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.error_outlined,color: Color.fromARGB(
                121, 71, 70, 70),size: 40,),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('未参与!',style: TextStyle(color: Colors.black,fontSize: 18),),
                  Text('测试已结束，点击下方“查看试卷”可以查看试卷',style: TextStyle(color: Colors.grey),overflow: TextOverflow.ellipsis,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mapHintContainer(int status,int state) {
    if (state == 1) {
      return endedContainer();
    } else if (state == 2 && status == 1) {
      return endedContainer();
    } else if (state == 2 && status != 1) {
      return failedSubmitContainer();
    } else if (state == 4) {
      return failedReviewContainer();
    } else if (state == 6 || state == 7 || (state == 8 && status ==3)) {
      return withScoreSubmitContainer();
    } else if ((state == 8 && status == 4) || state == 9) {
      return withoutScoreContainer();
    }else {
      return Container(
        child: Text('SB课堂派，不知道哪个傻冒写的答辩json'),
      );
    }
  }

  Future<void> getPaperInfo(String courseId,String paperId) async {
    final response = await ExamData.get().getExamData(courseId: courseId, paperId: paperId);
    if (response.code == 10000) {
      examInfo.value = response.data.testpaper;
      examInfo.value.description = HtmlUnescape().convert(examInfo.value.description);
    }
  }
  
}
