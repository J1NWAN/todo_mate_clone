import 'package:flutter/material.dart';
import 'package:scribble_todo/my/widget/setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0, // 앱바 스크롤시 색상 변경되는 현상 방지
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: const Text('설정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          child: Column(
            children: [
              SettingWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
