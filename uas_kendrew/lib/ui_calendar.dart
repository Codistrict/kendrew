// ignore_for_file: todo

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'home/service_home.dart';

class CalendarSf extends StatefulWidget {
  final String uid;
  const CalendarSf({super.key, required this.uid});

  @override
  State<CalendarSf> createState() => _CalendarSfState();
}

class _CalendarSfState extends State<CalendarSf> {
  List<Appointment> itemList = List.empty(growable: true);
  HomeService homeService = HomeService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    itemList.add(
      Appointment(
        startTime: DateTime.now().subtract(const Duration(days: 2)),
        endTime: DateTime.now().add(const Duration(days: 4)),
        subject: 'Field Trip',
        color: Colors.green,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.now().subtract(const Duration(days: 4)),
        endTime: DateTime.now().add(const Duration(days: 2)),
        subject: 'Meeting',
        color: Colors.amber,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.now().subtract(const Duration(days: 1)),
        endTime: DateTime.now().add(const Duration(days: 5)),
        subject: 'Project',
        color: Colors.blue,
      ),
    );
  }

  void onCalendarTapped(CalendarTapDetails details) {
    if (details.targetElement == CalendarElement.calendarCell) {
      DateTime? selectedDate = details.date;
      // Create a new appointment for the selected date
      Appointment newAppointment = Appointment(
        startTime: selectedDate!,
        endTime: selectedDate.add(const Duration(hours: 1)),
        subject: 'New Appointment',
        color: Colors.blue,
      );

      // Add the new appointment to the list of appointments
      setState(() {
        itemList.add(newAppointment);
      });
    }
  }

  void onCalendarSwiped(ViewChangedDetails details) {
    if (details.visibleDates.length == 1) {
      DateTime selectedDate = details.visibleDates[0];
      // Create a new appointment for the selected date
      Appointment newAppointment = Appointment(
        startTime: selectedDate,
        endTime: selectedDate.add(const Duration(hours: 1)),
        subject: 'New Appointment',
        color: Colors.blue,
      );

      // Add the new appointment to the list of appointments
      setState(() {
        itemList.add(newAppointment);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SfCalendar(
        dataSource: AppointmentDataSource(itemList),
        view: CalendarView.month,
        todayHighlightColor: Colors.teal,
        monthViewSettings: MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
          agendaViewHeight: deviceSize.height * 0.2,
          navigationDirection: MonthNavigationDirection.horizontal,
          appointmentDisplayCount: 4,
          numberOfWeeksInView: 6,
        ),
        firstDayOfWeek: 7,

        // Drag and drop Setting
        dragAndDropSettings: const DragAndDropSettings(),
        allowDragAndDrop: true,
        onDragUpdate: (appointmentDragUpdateDetails) {
          print(appointmentDragUpdateDetails.appointment);
        },

        // Resize Appointment

        allowAppointmentResize: true,
        onAppointmentResizeUpdate: (appointmentResizeUpdateDetails) {
          print(appointmentResizeUpdateDetails.resizingTime);
        },

        onTap: onCalendarTapped,
        onViewChanged: onCalendarSwiped,
      ),
    );
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
