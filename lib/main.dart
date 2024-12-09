import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:scribble_todo/feed/screen/feed_screen.dart';
import 'package:scribble_todo/look/screen/look_screen.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  // 화면 목록
  final List<Widget> screens = [
    const FeedScreen(),
    const LookScreen(),
    // const NotificationScreen(),
    // const MyScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '긁적글적',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: CommonColors.blueColor,
        ),
      ),
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: CommonColors.secondaryColor2,
          unselectedFontSize: 10,
          selectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: '피드'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.compass_fill), label: '둘러보기'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: '알림'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_fill), label: 'My'),
          ],
        ),
      ),
    );
  }
}
