import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: CommonColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const Text('프로필'),
          ],
        ),
        settingItemWidget(CupertinoIcons.person, '계정'),
        settingItemWidget(Icons.privacy_tip_outlined, '개인정보 보호'),
        settingItemWidget(Icons.monitor, '화면'),
        settingItemWidget(CupertinoIcons.bell, '알림'),
        settingItemWidget(Icons.campaign_outlined, '공지사항'),
        settingItemWidget(CupertinoIcons.smiley, '내 스티커'),
        settingItemWidget(Icons.workspace_premium_outlined, 'Premium'),
        settingItemWidget(Icons.info_outline, '정보'),
        settingItemWidget(Icons.help_outline, '문의하기'),
        settingItemWidget(CupertinoIcons.hand_thumbsup, '개발자 응원하기'),
        settingItemWidget(CupertinoIcons.lab_flask, '실험실'),
        const SizedBox(height: 40),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('버전'),
            SizedBox(width: 10),
            Text('1.0.0'),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              print('로그아웃');
            },
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text('로그아웃'),
            ),
          ),
        )
      ],
    );
  }

  Widget settingItemWidget(IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        print('$title 클릭');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Icon(icon, size: 25),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
