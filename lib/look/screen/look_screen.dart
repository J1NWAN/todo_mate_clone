import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scribble_todo/look/widget/search_bar_widget.dart';
import 'package:scribble_todo/look/widget/search_grid_widget.dart';

class LookScreen extends StatelessWidget {
  const LookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasDivision = Random().nextBool();

    return SafeArea(
      child: Column(
        children: [
          const SearchBarWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(10, (index) => SearchGridWidget(userName: '사용자$index', division: hasDivision ? 'todo' : 'diary')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
