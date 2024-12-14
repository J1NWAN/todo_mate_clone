import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/widget/people_widget.dart';

class SearchGridWidget extends StatelessWidget {
  final String userName;
  final String division;
  const SearchGridWidget({super.key, required this.userName, required this.division});

  @override
  Widget build(BuildContext context) {
    return PeopleWidget(userName: userName, division: division);
  }
}
