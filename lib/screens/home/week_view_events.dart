import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';
import 'package:intl/intl.dart';

class WeekViewEvents extends StatefulWidget {
  @override
  _WeekViewEventsState createState() => _WeekViewEventsState();
}

class _WeekViewEventsState extends State<WeekViewEvents> {

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text("Week View"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DayView(
              initialTime: const HourMinute(hour: 7),
              date: now,
              events: [
                FlutterWeekViewEvent(

                  title: 'Event 1',
                  description: 'Match 6',
                  start: date.subtract(const Duration(hours: 1)),
                  end: date.add(const Duration(hours: 5, minutes: 30)),
                ),
                FlutterWeekViewEvent(
                  backgroundColor: Colors.grey,
                  title: 'Event 2',
                  description: 'Match 1',
                  start: date.add(const Duration(hours: 19)),
                  end: date.add(const Duration(hours: 22)),
                ),
                FlutterWeekViewEvent(
                  title: 'Event 3',
                  description: 'Booking',
                  start: date.add(const Duration(hours: 23, minutes: 30)),
                  end: date.add(const Duration(hours: 25, minutes: 30)),
                ),
                FlutterWeekViewEvent(
                  backgroundColor: Colors.redAccent,
                  title: 'Event 4',
                  description: 'Interview at Google',
                  start: date.add(const Duration(hours: 20)),
                  end: date.add(const Duration(hours: 21)),
                ),
                FlutterWeekViewEvent(
                  title: 'Event 5',
                  description: 'Exam 6',
                  start: date.add(const Duration(hours: 20)),
                  end: date.add(const Duration(hours: 21)),
                ),
              ],
              style: DayViewStyle.fromDate(
                date: date,
                currentTimeCircleColor: Colors.pink,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
