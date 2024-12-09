import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          cursorHeight: 16,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, size: 20),
            hintText: '계정 또는 키워드 검색',
            hintStyle: TextStyle(color: CommonColors.secondaryColor2, fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: CommonColors.primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: CommonColors.primaryColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.all(0),
            filled: true,
            fillColor: CommonColors.primaryColor,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.exclamationmark_circle_fill, size: 20),
            ),
          ),
        ),
      ),
    );
  }
}
