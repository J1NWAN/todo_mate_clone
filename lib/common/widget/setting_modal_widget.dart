import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class SettingModalWidget extends StatefulWidget {
  String selectedValue;
  final Function(String) setModalState;

  SettingModalWidget({super.key, required this.selectedValue, required this.setModalState});

  @override
  State<SettingModalWidget> createState() => _SettingModalWidgetState();
}

class _SettingModalWidgetState extends State<SettingModalWidget> {
  @override
  Widget build(BuildContext context) {
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
                              widget.selectedValue = value;
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
                            widget.selectedValue = widget.selectedValue;
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
              widget.selectedValue == '나만보기'
                  ? Icons.lock
                  : widget.selectedValue == '전체 공개'
                      ? Icons.public
                      : widget.selectedValue == '팔로워 공개'
                          ? Icons.group
                          : Icons.group_outlined,
              size: 16,
              color: Colors.grey),
          const SizedBox(width: 5),
          Text(widget.selectedValue, style: const TextStyle(fontSize: 12, color: Colors.white)),
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
            groupValue: widget.selectedValue,
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
