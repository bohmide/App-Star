// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../widgets/LoadingPage.dart';
import '../widgets/button_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final _minutInput = TextEditingController();
  final _heurInput = TextEditingController();
  final _subjectInput = TextEditingController();

  void clearText() {
    _minutInput.clear();
    _heurInput.clear();
    _subjectInput.clear();
  }

  var items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  late int selectedDay;
  late int selectedMonth;
  late int selectedHour;
  late int selectedMinute;

  List<Color> colors = [
    Colors.green,
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.red,
    Colors.blue,
  ];

  Color _selectedColor = Colors.green;

  String? dropdownvalue;
  List<Appointment> meetings = <Appointment>[];

  void retar(bool valid) async {
    _loadingPopUp(context);
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    Navigator.of(context).pop();
    _validatPopUp(context, valid);
  }

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width / 25;
    Size size = MediaQuery.of(context).size;

    dropdownvalue = items[DateTime.now().month - 1];
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size(MediaQuery.of(context).size.width, size.height * 0.05),
          child: Row(children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            const Text("Back")
          ]),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 0, left: x, right: x),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                _Calendar(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Date",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: _MonthDayInput(),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Time",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _HourInput(),
                      const SizedBox(
                        width: 10,
                      ),
                      _MinuteInput(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Subject",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      _SubjectInput(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _choseColor(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _BtnSubmit(),
                      _BtnReset(),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _MonthDayInput() {
    return DropdownDatePicker(
      monthFlex: 1,
      dayFlex: 1,
      isDropdownHideUnderline: true, // optional
      isFormValidator: true, // optional
      startYear: 2000, // optional
      endYear: 2050, // optional
      width: 10, // optional
      //selectedDay: DateTime.now().day, // optional
      //selectedMonth: DateTime.now().month, // optional
      //selectedYear: DateTime.now().year, // optional
      onChangedDay: (day) {
        if (day != null) {
          setState(() {
            selectedDay = int.parse(day);
          });
        }
      },
      onChangedMonth: (month) {
        if (month != null) {
          setState(() {
            selectedMonth = int.parse(month);
          });
        }
      },

      //onChangedYear: (value) => print('onChangedYear: $value'),
      showYear: false,

      // 7-12-13-20
      hintDay: 'Jour',
      hintMonth: 'Mois',
      locale: "fr_FR",
      inputDecoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10))), // optional
    );
  }

  // ignore: unused_element
  Widget _DayInput() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      child: const TextField(
        decoration: InputDecoration(border: OutlineInputBorder()),
      ),
    );
  }

  Widget _HourInput() {
    return Flexible(
      flex: 1,
      child: TextField(
        controller: _heurInput,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: "Heure",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {
            selectedHour = int.tryParse(value) ?? 0;
          });
        },
      ),
    );
  }

  Widget _SubjectInput() {
    return TextField(
      controller: _subjectInput,
      decoration:
          InputDecoration(hintText: "Subject", border: OutlineInputBorder()),
    );
  }

  Widget _MinuteInput() {
    return Flexible(
      flex: 1,
      child: TextField(
        controller: _minutInput,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: "Minute",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {
            selectedMinute = int.tryParse(value) ?? 0;
          });
        },
      ),
    );
  }

  Widget _BtnSubmit() {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.3,
      child: ButtonWidget(
          text: 'Submit',
          backColor: const [
            Colors.green,
            Color.fromARGB(255, 33, 160, 99),
          ],
          textColor: const [
            Colors.white,
            Colors.white,
          ],
          onPressed: () async {
            final appointment = _addAppointment();
            retar(_validatApp(appointment));

            if (_validatApp(appointment)) {
              setState(() {
                meetings.add(appointment);
                clearText();
              });
            }
          }),
    );
  }

  Widget _BtnReset() {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.3,
      child: ButtonWidget(
          text: 'Reset',
          backColor: const [
            Colors.green,
            Color.fromARGB(255, 33, 160, 99),
          ],
          textColor: const [
            Colors.white,
            Colors.white,
          ],
          onPressed: () async {
            clearText();
          }),
    );
  }

  Widget _Calendar() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black54),
      ),
      child: SfCalendar(
        view: CalendarView.month,
        showNavigationArrow: true,
        showDatePickerButton: true,
        showTodayButton: true,
        allowDragAndDrop: true,
        showWeekNumber: true,
        allowAppointmentResize: true,
        allowViewNavigation: true,
        showCurrentTimeIndicator: true,
        timeSlotViewSettings:
            const TimeSlotViewSettings(startHour: 8, endHour: 17),
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }

  Widget _choseColor() {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => _selectedColor = colors[i],
            child: Container(
              color: colors[i],
              height: 30,
              width: 30,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }

  void _loadingPopUp(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: SizedBox(height: 60, width: 60, child: LoadingPage()),
          );
        });
  }

  void _validatPopUp(context, bool valid) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SizedBox(
                  height: 60,
                  width: 60,
                  child: Center(
                      child: valid
                          ? const Text("syae")
                          : const Text("masayech"))));
        });
  }

  bool _validatApp(Appointment app) {
    for (var i = 0; i < meetings.length; i++) {
      if (meetings[i].startTime == app.startTime) {
        return false;
      }
    }
    return true;
  }

  Appointment _addAppointment() {
    final DateTime startTime = DateTime(
      DateTime.now().year,
      selectedMonth,
      selectedDay,
      selectedHour,
      selectedMinute,
    );
    final DateTime endTime = startTime.add(const Duration(hours: 1));

    return Appointment(
      subject: _subjectInput.text,
      startTime: startTime,
      endTime: endTime,
      color: _selectedColor,
    );
  }

  List<Appointment> getAppointments() {
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
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
