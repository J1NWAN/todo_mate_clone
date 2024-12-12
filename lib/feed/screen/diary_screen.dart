import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  String selectedValue = '나만보기';
  String selectedEmoji = '';
  List<String> emojiList = [
    '😀',
    '😃',
    '😄',
    '😁',
    '😆',
    '😅',
    '😂',
    '🤣',
    '😊',
    '😇',
    '🙂',
    '🙃',
    '😉',
    '😌',
    '😍',
    '😘',
    '😗',
    '😙',
    '😚',
    '😋',
    '😌',
    '😍',
    '😘',
    '😗',
    '😙',
    '😚'
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setModalState) {
                        return Container(
                          height: 330,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '이모지',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // 이모지 그리드 레이아웃
                              SizedBox(
                                height: 250,
                                width: double.infinity,
                                child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 6,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  itemCount: emojiList.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // 이모지 선택 로직
                                        setState(() {
                                          selectedEmoji = emojiList[index];
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        emojiList[index],
                                        style: const TextStyle(fontSize: 30),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  );
                },
                icon: selectedEmoji.isNotEmpty
                    ? Text(selectedEmoji, style: const TextStyle(fontSize: 35))
                    : const Icon(
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

                        // 바텀 모달 위젯
                        showModalBottomWidget(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'me님의 오늘은 어떤 하루였나요?',
                  hintStyle: TextStyle(fontSize: 12, color: CommonColors.secondaryColor2),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 바텀 모달 위젯
  Widget showModalBottomWidget() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return StatefulBuilder(builder: (context, setModalState) {
              return Container(
                height: 420,
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
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return showModalBottomItemWidget(index, (String value) {
                            setModalState(() {
                              selectedValue = value;
                            });
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedValue = selectedValue;
                          });
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
      child: Row(
        children: [
          Icon(
              selectedValue == '나만보기'
                  ? Icons.lock
                  : selectedValue == '전체 공개'
                      ? Icons.public
                      : selectedValue == '팔로워 공개'
                          ? Icons.group
                          : Icons.group_outlined,
              size: 16,
              color: Colors.grey),
          const SizedBox(width: 5),
          Text(selectedValue, style: const TextStyle(fontSize: 12, color: Colors.white)),
          const Icon(Icons.arrow_drop_down, size: 16, color: Colors.white),
        ],
      ),
    );
  }

  // 바텀 모달 아이템 위젯
  Widget showModalBottomItemWidget(int index, Function(String) setModalState) {
    List<String> list = ['전체 공개', '팔로워 공개', '일부 공개', '나만보기'];
    List<IconData> iconList = [Icons.public, Icons.group, Icons.group_outlined, Icons.lock];

    return Column(
      children: [
        ListTile(
          leading: Icon(iconList[index]),
          title: Text(list[index]),
          trailing: Radio(
            value: list[index],
            groupValue: selectedValue,
            onChanged: (value) {
              setModalState(value!);
            },
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
