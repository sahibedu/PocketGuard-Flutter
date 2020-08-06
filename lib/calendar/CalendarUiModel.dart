import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:pocket_guard/ActiveColors.dart';
import 'package:pocket_guard/BaseViewModel.dart';

class CalendarUiModel implements BaseViewModel {
  @override
  Widget getViewType() {
    return CalendarWidget();
  }
}

class CalendarWidget extends StatefulWidget {
  @override
  State createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ActiveColors["calendarBackground"],
      child: CalendarCarousel<Event>(
        height: 420,
        onDayPressed: (DateTime dateTime, List<Event> event) {
          setState(() {
            _selectedDate = dateTime;
          });
        },
        todayButtonColor: ActiveColors,
        selectedDayButtonColor: ActiveColors["colorPrimary"],
        iconColor: ActiveColors["fontDark"],
        weekDayFormat: WeekdayFormat.narrow,
        selectedDateTime: _selectedDate,
        minSelectedDate: DateTime.now().subtract(Duration(days: 365)),
        maxSelectedDate: DateTime.now().add(Duration(days: 30)),
        headerMargin: EdgeInsets.all(8),
        headerTextStyle: TextStyle(
            fontSize: 16,
            color: ActiveColors["fontDark"],
            fontWeight: FontWeight.bold),
        dayPadding: 0,
        weekdayTextStyle:
            TextStyle(fontSize: 12, color: ActiveColors["fontLight"]),
        weekendTextStyle:
            TextStyle(fontSize: 12, color: ActiveColors["fontDark"]),
        daysTextStyle: TextStyle(fontSize: 12, color: ActiveColors["fontDark"]),
        todayTextStyle:
            TextStyle(fontSize: 14, color: ActiveColors["colorPrimaryDark"]),
        selectedDayTextStyle: TextStyle(fontSize: 12, color: Colors.white),
      ),
    );
  }
}
