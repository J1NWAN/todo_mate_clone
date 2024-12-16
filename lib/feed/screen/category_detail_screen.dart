import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/data/common_data.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:scribble_todo/common/widget/setting_modal_widget.dart';
import 'package:scribble_todo/feed/widget/color_modal_widget.dart';
import 'package:scribble_todo/feed/widget/exit_modal_widget.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String categoryName;
  final Color categoryColor;

  const CategoryDetailScreen({super.key, required this.categoryName, required this.categoryColor});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  int selectedSettingIndex = 0;
  String selectedSettingValue = '나만보기';
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.categoryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0, // 앱바 스크롤시 색상 변경되는 현상 방지
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, size: 20),
        ),
        title: const Text('카테고리', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('확인', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              autofocus: true,
              controller: TextEditingController(text: widget.categoryName),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                filled: true,
                fillColor: Colors.black,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: widget.categoryColor),
                ),
              ),
              style: TextStyle(color: widget.categoryColor, fontSize: 14),
              onSubmitted: (value) {
                print('');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('공개설정', style: TextStyle(color: Colors.white, fontSize: 13)),
              trailing: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, selectModalValue) {
                          return SettingModalWidget(
                            selectedValue: selectedSettingValue,
                            selectModalValue: (index, value) {
                              setState(() {
                                selectedSettingIndex = index;
                                selectedSettingValue = value;
                              });
                            },
                          );
                        },
                      );
                    },
                  );
                },
                child: SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(CommonData.privacySettingIconList[selectedSettingIndex], size: 18, color: CommonColors.secondaryColor),
                      const SizedBox(width: 5),
                      Text(selectedSettingValue, style: const TextStyle(color: Colors.white, fontSize: 13)),
                      Icon(Icons.arrow_drop_down, size: 16, color: CommonColors.secondaryColor),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: CommonColors.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('색상', style: TextStyle(color: Colors.white, fontSize: 13)),
              trailing: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, selectModalValue) {
                          return ColorModalWidget(
                            parameterColor: selectedColor,
                            selectColor: (color) {
                              setState(() {
                                selectedColor = color;
                              });
                            },
                          );
                        },
                      );
                    },
                  );
                },
                child: SizedBox(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(color: selectedColor, borderRadius: BorderRadius.circular(10)),
                      ),
                      Icon(Icons.arrow_drop_down, size: 16, color: CommonColors.secondaryColor),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: CommonColors.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const ExitModalWidget();
                        },
                      );
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(color: CommonColors.primaryColor, borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          '종료하기',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(color: CommonColors.primaryColor, borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        '삭제',
                        style: TextStyle(color: Colors.red, fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
