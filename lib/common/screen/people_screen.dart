import 'package:flutter/material.dart';
import 'package:scribble_todo/common/widget/calendar_widget.dart';
import 'package:scribble_todo/common/widget/profile_widget.dart';
import 'package:scribble_todo/common/widget/todo_widget.dart';

class PeopleScreen extends StatelessWidget {
  final String userName;
  const PeopleScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue.shade900,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              textStyle: const TextStyle(fontSize: 12),
              minimumSize: const Size(50, 30), // 버튼의 최소 크기를 지정
            ),
            child: const Text('팔로우'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileWidget(userName: userName, division: 'people'),
            const CalendarWidget(),
            const TodoWidget(division: 'people'),
          ],
        ),
      ),
    );
  }
}
