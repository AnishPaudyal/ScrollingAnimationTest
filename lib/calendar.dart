import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventCalendar extends StatefulWidget {
  const EventCalendar({super.key});

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [],
          backgroundColor: Colors.blueGrey,
        ),
        body: SfCalendar(
          onTap: (calendarTapDetails) => {
            debugPrint(calendarTapDetails.toString()),
          },
          cellBorderColor: Colors.white,
          view: CalendarView.month,
          headerStyle: CalendarHeaderStyle(
              backgroundColor: Colors.blueGrey[900],
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              )),
          viewHeaderStyle: ViewHeaderStyle(
              backgroundColor: Colors.blueGrey[900],
              dayTextStyle: const TextStyle(
                color: Colors.white,
              )),
          dataSource: MeetingDataSource(getAppointments()),
          backgroundColor: Colors.blueGrey,
          todayHighlightColor: Colors.transparent,
          todayTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          monthViewSettings: const MonthViewSettings(
            agendaItemHeight: 100,
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            appointmentDisplayCount: 3,
            monthCellStyle: MonthCellStyle(
                backgroundColor: Colors.blueGrey,
                leadingDatesBackgroundColor: Colors.blueGrey,
                trailingDatesBackgroundColor: Colors.blueGrey,
                todayBackgroundColor: Colors.green,
                textStyle: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
                leadingDatesTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                trailingDatesTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                )),
            showAgenda: true,
          ),
        ),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(2023, 5, 12, 8, 0, 0);
  final DateTime endTime = DateTime(2023, 5, 12, 10, 0, 0);

  meetings.add(
    Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Tennis',
      color: Colors.green,
    ),
  );

  final DateTime startTime2 = DateTime(2023, 5, 15, 11, 0, 0);
  final DateTime endTime2 = DateTime(2023, 5, 15, 12, 0, 0);

  meetings.add(
    Appointment(
      startTime: startTime2,
      endTime: endTime2,
      subject: 'Hockey',
      color: Colors.blue,
    ),
  );

  final DateTime startTime3 = DateTime(2023, 5, 15, 8, 0, 0);
  final DateTime endTime3 = DateTime(2023, 5, 15, 10, 0, 0);

  meetings.add(
    Appointment(
      startTime: startTime3,
      endTime: endTime3,
      subject: 'Football',
      color: Colors.green,
    ),
  );

  final DateTime startTime1 = DateTime(2023, 5, 15, 8, 0, 0);
  final DateTime endTime1 = DateTime(2023, 5, 15, 10, 0, 0);

  meetings.add(
    Appointment(
      startTime: startTime1,
      endTime: endTime1,
      subject: 'Basketball',
      color: Colors.red,
    ),
  );
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
