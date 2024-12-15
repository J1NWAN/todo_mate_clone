import 'package:flutter/material.dart';

class ColorModalWidget extends StatefulWidget {
  final Color parameterColor;
  final Function(Color) selectColor;

  const ColorModalWidget({super.key, required this.parameterColor, required this.selectColor});

  @override
  State<ColorModalWidget> createState() => _ColorModalWidgetState();
}

class _ColorModalWidgetState extends State<ColorModalWidget> {
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.parameterColor;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colorsList = [
      Colors.red[300]!,
      Colors.pink[300]!,
      Colors.purple[300]!,
      Colors.deepPurple[300]!,
      Colors.indigo[300]!,
      Colors.blue[300]!,
      Colors.lightBlue[300]!,
      Colors.cyan[300]!,
      Colors.teal[300]!,
      Colors.green[300]!,
      Colors.lightGreen[300]!,
      Colors.lime[300]!,
      Colors.yellow[300]!,
      Colors.amber[300]!,
      Colors.orange[300]!,
      Colors.deepOrange[300]!,
      Colors.brown[300]!,
      Colors.blueGrey[300]!,
      Colors.pink[200]!,
      Colors.purple[200]!,
      Colors.deepPurple[200]!,
      Colors.indigo[200]!,
      Colors.blue[200]!,
      Colors.lightBlue[200]!,
      Colors.cyan[200]!,
      Colors.teal[200]!,
      Colors.green[200]!,
      Colors.lightGreen[200]!,
      Colors.lime[200]!,
      Colors.amber[200]!,
      Colors.orange[200]!,
      Colors.deepOrange[200]!,
      Colors.red[100]!,
      Colors.purple[100]!,
      Colors.indigo[100]!,
      Colors.lightBlue[100]!,
      Colors.teal[100]!,
      Colors.lightGreen[100]!,
      Colors.yellow[100]!,
      Colors.deepOrange[100]!,
      Colors.brown[100]!,
      Colors.grey[100]!,
    ];

    return Wrap(
      children: [
        Container(
          height: 600,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '색상',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              // 이모지 그리드 레이아웃
              SizedBox(
                height: 400,
                width: double.infinity,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 35,
                  ),
                  itemCount: colorsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = colorsList[index];
                          widget.selectColor(selectedColor);
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorsList[index],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: selectedColor == colorsList[index]
                            ? const Icon(Icons.check, color: Colors.black, size: 20)
                            : const SizedBox.shrink(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
