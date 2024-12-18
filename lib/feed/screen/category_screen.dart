import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:scribble_todo/feed/screen/category_create_screen.dart';
import 'package:scribble_todo/feed/screen/category_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryCreateScreen()));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text('일반', style: TextStyle(fontSize: 12, color: CommonColors.secondaryColor2)),
          ),
          ...List.generate(3, (index) => categoryItem('카테고리 ${index + 1}', CommonColors.categoryColorList[index], context)),
        ],
      ),
    );
  }

  Widget categoryItem(String categoryName, Color categoryColor, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategoryDetailScreen(categoryName: categoryName, categoryColor: categoryColor)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        alignment: Alignment.centerLeft,
        child: IntrinsicWidth(
          child: Container(
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: CommonColors.primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                categoryName,
                style: TextStyle(
                  fontSize: 12,
                  color: categoryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
