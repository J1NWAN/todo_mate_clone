import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  int? _openTextFieldIndex;

  @override
  Widget build(BuildContext context) {
    List<Color> categoryColorList = [
      const Color.fromRGBO(229, 115, 115, 1),
      const Color.fromRGBO(129, 199, 132, 1),
      const Color.fromRGBO(100, 181, 246, 1)
    ];
    List<String> categoryNameList = ['카테고리 1', '카테고리 2', '카테고리 3'];

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          ...List.generate(
            3,
            (index) => TodoItemWidget(
              categoryName: categoryNameList[index],
              categoryColor: categoryColorList[index],
              isTextFieldVisible: _openTextFieldIndex == index,
              onToggleTextField: () {
                setState(() {
                  _openTextFieldIndex = _openTextFieldIndex == index ? null : index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TodoItemWidget extends StatelessWidget {
  final String categoryName;
  final Color categoryColor;
  final bool isTextFieldVisible;
  final VoidCallback onToggleTextField;

  const TodoItemWidget({
    required this.categoryName,
    required this.categoryColor,
    required this.isTextFieldVisible,
    required this.onToggleTextField,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicWidth(
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            constraints: BoxConstraints(
              minWidth: 150,
              maxWidth: deviceWidth * 0.66,
            ),
            height: 35,
            decoration: BoxDecoration(
              color: CommonColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    size: 18,
                    color: CommonColors.secondaryColor2,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      categoryName,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: categoryColor),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: onToggleTextField,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: CommonColors.secondaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        if (isTextFieldVisible)
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.check_box_outline_blank, size: 24, color: CommonColors.secondaryColor2),
                ),
                Flexible(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                      hintText: '할 일을 입력하세요',
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.black,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: categoryColor),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    onSubmitted: (value) {
                      onToggleTextField();
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: CommonColors.secondaryColor2,
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
