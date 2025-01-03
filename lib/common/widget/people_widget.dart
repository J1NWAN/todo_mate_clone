import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/screen/people_screen.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class PeopleWidget extends StatelessWidget {
  final String userName;
  final String division;

  const PeopleWidget({super.key, required this.userName, required this.division});

  @override
  Widget build(BuildContext context) {
    List<Row> randomTodoWidget() {
      Random random = Random();

      return List.generate(
        random.nextInt(4) + 1,
        (index) => Row(
          children: [
            Icon(Icons.check_box, size: 20, color: CommonColors.randomColor()),
            const SizedBox(width: 5),
            const Text('안녕하세요.'),
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PeopleScreen(userName: userName)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: CommonColors.randomColor(),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    userName,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                              print('신고하기');
                            },
                            child: const Text('신고하기'),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.pop(context);
                            print('취소');
                          },
                          child: const Text('취소'),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.more_horiz),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 100,
                        child: division == 'todo'
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: randomTodoWidget(),
                              )
                            : const Text('오늘 할일 없음\n그래서 매우 슬프다.'),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
