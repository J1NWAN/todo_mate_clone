import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class DialogWidget extends StatelessWidget {
  final String content;
  final String buttonName1;
  final String? buttonName2;
  final String? title;
  const DialogWidget({super.key, required this.content, required this.buttonName1, this.buttonName2, this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CommonColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: title != null
          ? Text(title!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.center)
          : null,
      contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      content: Text(
        content,
        style: const TextStyle(fontSize: 11),
        textAlign: TextAlign.center,
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(125, 0),
            backgroundColor: CommonColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text(
            buttonName1,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        buttonName2 != null
            ? ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(125, 0),
                  backgroundColor: CommonColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  buttonName2!,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
