import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:scribble_todo/common/widget/people_widget.dart';

class FriendTodoWidget extends StatelessWidget {
  const FriendTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasNoItems = Random().nextBool();
    bool hasDivision = Random().nextBool();
    if (hasNoItems) {
      return const Expanded(
        child: Center(
          child: Text(
            '목록 없음',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(10, (index) => PeopleWidget(userName: '친구$index', division: hasDivision ? 'todo' : 'diary')),
          ],
        ),
      ),
    );
  }
}
