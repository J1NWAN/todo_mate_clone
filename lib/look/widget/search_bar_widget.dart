import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:scribble_todo/common/widget/dialog_widget.dart';

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
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const DialogWidget(
                    title: '둘러보기 검색',
                    content: '이메일, ID 또는 키워드로 계정을 검색하실 수 있스빈다. 나의 할 일은 My탭의 나의 기록에서 이용하실 수 있습니다.',
                    buttonName1: '확인',
                  ),
                );
              },
              icon: const Icon(CupertinoIcons.exclamationmark_circle_fill, size: 20),
            ),
          ),
        ),
      ),
    );
  }
}
