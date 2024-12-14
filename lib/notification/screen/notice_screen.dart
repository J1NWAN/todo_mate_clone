import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

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
        title: const Text('공지사항', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 20, // 공지사항 개수에 따라 조정
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '공지사항의 상세 내용이 여기에 들어갑니다.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                '2024. 12. 14.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Divider(height: 30),
            ],
          );
        },
      ),
    );
  }
}
