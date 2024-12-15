import 'package:flutter/material.dart';
import 'package:scribble_todo/common/data/common_data.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';

class SettingModalWidget extends StatefulWidget {
  String selectedValue;
  final Function(int, String) selectModalValue;

  SettingModalWidget({super.key, required this.selectedValue, required this.selectModalValue});

  @override
  State<SettingModalWidget> createState() => _SettingModalWidgetState();
}

class _SettingModalWidgetState extends State<SettingModalWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: 400,
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
                      setState(() {
                        selectedIndex = index;
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
                      widget.selectModalValue(
                        selectedIndex,
                        widget.selectedValue,
                      );
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
        ),
      ],
    );
  }

  // 바텀 모달 아이템 위젯
  Widget showModalBottomItemWidget(int index, Function(String) setModalState) {
    List<String> list = CommonData.privacySettingList;
    List<IconData> iconList = CommonData.privacySettingIconList;

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
