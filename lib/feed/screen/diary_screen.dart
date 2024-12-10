import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('일기', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('완료', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
          )
        ],
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.smiley,
                size: 50,
                color: Color.fromRGBO(140, 140, 200, 1.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: CommonColors.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'me',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        DateFormat('yyyy년 MM월 dd일 EEEE', 'ko').format(DateTime.now()),
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              int selectedValue = 0;
                              return StatefulBuilder(builder: (context, setState) {
                                return Container(
                                  height: 380,
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '공개 설정',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      ListTile(
                                        leading: const Icon(Icons.public),
                                        title: const Text('전체 공개'),
                                        trailing: Radio(
                                          value: 0,
                                          groupValue: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      const Divider(height: 0),
                                      ListTile(
                                        leading: const Icon(Icons.group),
                                        title: const Text('팔로워 공개'),
                                        trailing: Radio(
                                          value: 1,
                                          groupValue: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      const Divider(height: 0),
                                      ListTile(
                                        leading: const Icon(Icons.group_outlined),
                                        title: const Text('일부 공개'),
                                        trailing: Radio(
                                          value: 2,
                                          groupValue: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      const Divider(height: 0),
                                      ListTile(
                                        leading: const Icon(Icons.lock),
                                        title: const Text('나만보기'),
                                        trailing: Radio(
                                          value: 3,
                                          groupValue: selectedValue,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedValue = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      const Divider(height: 0),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: CommonColors.secondaryColor2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: const Text('확인', style: TextStyle(fontSize: 14, color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            },
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.lock, size: 16, color: Colors.grey),
                            SizedBox(width: 5),
                            Text('나만보기', style: TextStyle(fontSize: 12, color: Colors.white)),
                            Icon(Icons.arrow_drop_down, size: 16, color: Colors.white),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
