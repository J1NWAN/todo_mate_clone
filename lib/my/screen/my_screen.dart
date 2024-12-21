import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:scribble_todo/common/widget/profile_widget.dart';
import 'package:scribble_todo/my/service/my_service.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          const ProfileWidget(userName: 'me', division: 'my', secondText: 'user@email.com'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: CommonColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.bar_chart, size: 30), SizedBox(height: 8), Text('나의 기록', style: TextStyle(fontSize: 12))],
                        ),
                        Container(
                          height: 50,
                          width: 1,
                          color: CommonColors.secondaryColor,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.workspace_premium, size: 30),
                            SizedBox(height: 8),
                            Text('Premium', style: TextStyle(fontSize: 12))
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 1,
                          color: CommonColors.secondaryColor,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('😱', style: TextStyle(fontSize: 30)),
                            SizedBox(height: 8),
                            Text('스티커샵', style: TextStyle(fontSize: 12))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: CommonColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('노트', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          const Text('0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(Icons.import_contacts, size: 24, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: CommonColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('보관함', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          const Text('0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(Icons.card_giftcard, size: 24, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: MyService().getAdvice(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (!snapshot.hasData) {
                return const SizedBox.shrink();
              }

              final advice = snapshot.data!;
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Text('"${advice['message']}"', style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
                    const SizedBox(height: 4),
                    Text(advice['author'], style: TextStyle(fontSize: 10, color: CommonColors.secondaryColor2)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
