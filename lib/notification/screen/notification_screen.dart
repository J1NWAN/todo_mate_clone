import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:scribble_todo/notification/widget/friend_todo_widget.dart';
import 'package:scribble_todo/notification/widget/news_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> notificationWords = ['친구의 할 일', '친구의 일기', '받은 좋아요', '소식'];
  String selectedWord = '친구의 할 일';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '알림',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                ...List.generate(notificationWords.length, (index) => notificationWordingItem(notificationWords[index])),
              ],
            ),
          ),
          if (selectedWord == '친구의 할 일') const FriendTodoWidget(),
          if (selectedWord == '소식') const NewsWidget(),
        ],
      ),
    );
  }

  Widget notificationWordingItem(String word) {
    final bool isSelected = selectedWord == word;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedWord = word;
        });
      },
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : CommonColors.primaryColor,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: CommonColors.primaryColor) : null,
        ),
        child: Center(
          child: Text(
            word,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
