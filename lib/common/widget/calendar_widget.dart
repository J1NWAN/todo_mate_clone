import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_todo/common/theme/common_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      firstDay: DateTime.utc(2024, 1, 1),
      lastDay: DateTime.utc(2024, 12, 31),
      focusedDay: DateTime.now(),
      calendarFormat: _calendarFormat,
      daysOfWeekHeight: 20,
      rowHeight: 60,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        leftChevronMargin: EdgeInsets.zero,
        rightChevronMargin: EdgeInsets.zero,
        headerPadding: EdgeInsets.zero,
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
      ),
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return headerTitleItem(_selectedDay);
        },
        prioritizedBuilder: (context, day, focusedDay) {
          return checkboxItem(day, _selectedDay);
        },
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: const TextStyle(color: Colors.white),
        weekendStyle: TextStyle(color: Colors.red[300]),
      ),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
        });
      },
    );
  }

  // 헤더 타이틀 위젯
  Widget headerTitleItem(DateTime selectedDay) {
    return Row(
      children: [
        Text(
          '${selectedDay.year}년 ${selectedDay.month}월',
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
          children: [
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(Icons.check_box, color: CommonColors.blueColor, size: 16)),
                const Text('0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(CupertinoIcons.smiley_fill, color: CommonColors.yellowColor, size: 16)),
                const Text('0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(CupertinoIcons.heart_fill, color: CommonColors.redColor, size: 16)),
                const Text('0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          ],
        ),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                setState(() {
                  _calendarFormat = _calendarFormat == CalendarFormat.week ? CalendarFormat.month : CalendarFormat.week;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Text(
                  _calendarFormat == CalendarFormat.week ? '주' : '월',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 캘린더 체크박스 위젯
  Widget checkboxItem(DateTime day, DateTime selectedDay) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 4),
        if (day.day == selectedDay.day)
          Container(
            alignment: Alignment.center,
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '${day.day}',
              style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          )
        else if (day.day == DateTime.now().day)
          Container(
            alignment: Alignment.center,
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '${day.day}',
              style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          )
        else
          Container(
            alignment: Alignment.center,
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '${day.day}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
      ],
    );
  }
}
