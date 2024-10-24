import 'package:flutter/material.dart';
import 'package:fuckketangpai/selfwidgets/loading_dialog.dart';

class SendSuggestions extends StatefulWidget {
  const SendSuggestions({super.key});

  @override
  State<SendSuggestions> createState() => _SendSuggestionsState();
}

class _SendSuggestionsState extends State<SendSuggestions> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      children: [
        Text('意见反馈',textScaleFactor: 3,),
        ElevatedButton(onPressed: () => LoadingDialog.showLoadingDialog(context: context,hintText: '加载中...'), child: Text('测试'))
      ],
    ));
  }
}
