import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class ExitModalWidget extends StatefulWidget {
  const ExitModalWidget({super.key});

  @override
  State<ExitModalWidget> createState() => _ExitModalWidgetState();
}

class _ExitModalWidgetState extends State<ExitModalWidget> {
  String selectedValue = '카테고리를 완수했어요!';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: 330,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '종료하기',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return showModalBottomItemWidget(index, selectedValue);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => showExitDialog(),
                    );
                    //Navigator.pop(context);
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
        ),
      ],
    );
  }

  // 바텀 모달 아이템 위젯
  Widget showModalBottomItemWidget(int index, String selectedValue) {
    List<String> list = ['카테고리를 완수했어요!', '기간이 종료됐어요!', '아쉽지만 그만할래요'];
    List<IconData> iconList = [Icons.check, Icons.timer, Icons.close];

    return Column(
      children: [
        ListTile(
          leading: Icon(iconList[index]),
          title: Text(list[index]),
          trailing: Radio(
            value: list[index],
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                this.selectedValue = value!;
              });
            },
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }

  Widget showExitDialog() {
    return AlertDialog(
      backgroundColor: CommonColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: const Text('카테고리를 종료하시겠습니까?\n기존의 할 일 목록은 유지되지만 새로운 입력은 제한됩니다.', style: TextStyle(fontSize: 11), textAlign: TextAlign.center),
      actions: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(125, 0),
            backgroundColor: CommonColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            '취소',
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(125, 0),
            backgroundColor: CommonColors.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            '종료',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
