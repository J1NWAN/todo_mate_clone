import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:scribble_todo/feed/screen/diary_screen.dart';

class ProfileWidget extends StatelessWidget {
  final String userName;
  final String division;
  final String? secondText;

  const ProfileWidget({super.key, required this.userName, required this.division, this.secondText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: CommonColors.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  if (secondText != null)
                    Text(
                      secondText!,
                      style: TextStyle(
                        fontSize: 12,
                        color: CommonColors.secondaryColor2,
                      ),
                    ),
                  if (division == 'my')
                    const Row(
                      children: [
                        Text('팔로잉 ', style: TextStyle(fontSize: 12)),
                        Text('0', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                        SizedBox(width: 10),
                        Text('팔로워 ', style: TextStyle(fontSize: 12)),
                        Text('0', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      ],
                    )
                ],
              ),
            ],
          ),
          if (division == 'me')
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const DiaryScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
              icon: const Icon(
                CupertinoIcons.pencil_outline,
                color: Color.fromRGBO(140, 140, 200, 1.0),
              ),
            )
        ],
      ),
    );
  }
}
