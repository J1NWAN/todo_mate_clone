import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            2,
            (index) => StoryItemWidget(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}

class StoryItemWidget extends StatelessWidget {
  final int index;
  const StoryItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: CommonColors.primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: index == 0 ? const Icon(Icons.person, size: 20) : const Icon(Icons.chevron_right, size: 20),
          ),
          const SizedBox(height: 5),
          Text(index == 0 ? 'me' : '', style: const TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    );
  }
}
