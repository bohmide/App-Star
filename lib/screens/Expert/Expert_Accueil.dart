// ignore_for_file: file_names, non_constant_identifier_names, unused_element

import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

import '../../utils/Scrolling_Notif.dart';
import '../../widgets/Card1.dart';
import '../Appointment_Page.dart';
import '../Expert_List_demande_Client.dart';

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      controller: _scrollController,
      child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          // ignore: avoid_print
          print(direction);
          if (direction == ScrollDirection.reverse) {
            Provider.of<MyModel>(context, listen: false).MyVariables = true;
          } else if (direction == ScrollDirection.forward) {
            Provider.of<MyModel>(context, listen: false).MyVariables = false;
          }
          return true;
        },
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          height: MediaQuery.of(context).size.height,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  const Text(
                    "Expert",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  //_Calendar(),
                  _Calendar(),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(child: _ListCard())
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }

  Widget _Calendar() {
    return GestureDetector(
      onDoubleTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CalendarPage())),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black54),
        ),
        child: SfCalendar(
          view: CalendarView.day,
          viewNavigationMode: ViewNavigationMode.none,
          timeSlotViewSettings:
              const TimeSlotViewSettings(startHour: 8, endHour: 17),
          dataSource: MeetingDataSource(getAppointments()),
        ),
      ),
    );
  }

  List<Appointment> getAppointments() {
    List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 12, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 1));

    meetings.add(Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: 'karahba mkasra',
        color: Colors.green));

    meetings.add(Appointment(
        startTime: DateTime(today.year, today.month, today.day, 14, 0, 0),
        endTime: endTime,
        subject: 'karahba mkasra',
        color: Colors.amber));

    return meetings;
  }

  Widget _ListCard() {
    return const Wrap(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card1(
              title: "List Client",
              image: 'assets/AVG_Ptest1.svg',
              pageToGo: ListClient()),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card1(
              title: "Demande de modification",
              image: 'assets/AVG_Ptest1.svg',
              pageToGo: ListClient()),
        ),
      ],
    );
  }

  Widget _HelloExpert() {
    return Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Bonjour",
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Expert Name",
                style: TextStyle(
                  fontSize: 24,
                ),
              )
            ],
          ),
        ));
  }
}
