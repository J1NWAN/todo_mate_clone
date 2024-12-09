import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class SearchGridWidget extends StatelessWidget {
  final String userName;
  final String division;
  const SearchGridWidget({super.key, required this.userName, required this.division});

  Color randomColor() {
    final random = Random();
    final randomNumber = random.nextInt(5);

    List<Color> colors = [
      Colors.red[300]!,
      Colors.green[300]!,
      Colors.blue[300]!,
      Colors.yellow[300]!,
      Colors.purple[300]!,
    ];
    return colors[randomNumber];
  }

  List<Row> randomTodoWidget() {
    Random random = Random();

    return List.generate(
      random.nextInt(4) + 1,
      (index) => Row(
        children: [
          Icon(Icons.check_box, size: 20, color: randomColor()),
          const SizedBox(width: 5),
          const Text('안녕하세요.'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: randomColor(),
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
                onPressed: () {},
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
    );
  }
}
