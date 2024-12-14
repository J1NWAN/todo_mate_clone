import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:scribble_todo/common/widget/calendar_widget.dart';
import 'package:scribble_todo/common/widget/profile_widget.dart';
import 'package:scribble_todo/feed/widget/story_widget.dart';
import 'package:scribble_todo/common/widget/todo_widget.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0, // 앱바 스크롤시 색상 변경되는 현상 방지
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(color: CommonColors.primaryColor, borderRadius: BorderRadius.circular(30)),
            child: const Icon(Icons.logo_dev, size: 20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.date_range_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.paperplane),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: const Column(
        children: [
          StoryWidget(),
          SizedBox(height: 30),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileWidget(userName: 'me', division: 'me'),
                  CalendarWidget(),
                  TodoWidget(division: 'me'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
