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
        startTime: DateTime.parse('2023-06-25'),
        endTime: DateTime.parse('2023-07-08'),
        subject: 'Pondasi Plat setempat',
        color: Colors.green,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-07-09'),
        endTime: DateTime.parse('2023-07-22'),
        subject: 'Urug tanah Keseluruhan (t=70 cm)',
        color: Colors.red,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-07-23'),
        endTime: DateTime.parse('2023-07-29'),
        subject: 'Cor Kolom struktur (20/30)',
        color: Colors.blue,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-07-30'),
        endTime: DateTime.parse('2023-08-05'),
        subject: 'Cor Blok strruktur (30/30)',
        color: Colors.amber,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-08-06'),
        endTime: DateTime.parse('2023-08-12'),
        subject: 'Cor sloof (20/20)',
        color: Colors.green,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-08-13'),
        endTime: DateTime.parse('2023-08-19'),
        subject: 'Cor Kolom praktis (15/15)',
        color: Colors.purple,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-08-20'),
        endTime: DateTime.parse('2023-08-26'),
        subject: 'Cor Rabatan lantai (t=7 cm)',
        color: Colors.lightGreen,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-08-27'),
        endTime: DateTime.parse('2023-09-02'),
        subject: 'Cor Balok Tangga + Trap Tangga',
        color: Colors.lightBlue,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-09-03'),
        endTime: DateTime.parse('2023-09-16'),
        subject: 'Pasang bata putih untuk dinding dan bawah sloof',
        color: Colors.pink,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-09-17'),
        endTime: DateTime.parse('2023-09-23'),
        subject:
            'Plester dinding, kolom, balok, plat lantai 2 ( tanpa plafon), tangga',
        color: Colors.lime,
      ),
    );

    itemList.add(
      Appointment(
        startTime: DateTime.parse('2023-09-24'),
        endTime: DateTime.parse('2023-09-30'),
        subject:
            'Acian dinding, kolom, balok, plat lantai 2 (tanpa plafon), tangga',
        color: Colors.teal,
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
          appointmentDisplayCount: 1,
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
