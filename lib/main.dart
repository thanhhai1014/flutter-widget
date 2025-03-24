import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CalenderBox extends StatefulWidget {
  final String text1, text2;

  const CalenderBox({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  State<CalenderBox> createState() => _CalenderBoxState();
}

class _CalenderBoxState extends State<CalenderBox> {
  late bool _hasBorder;
  late String _s;

  @override
  void initState() {
    super.initState();
    _hasBorder = true;
    _s = widget.text1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      width: 70,
      height: 100,
      decoration: BoxDecoration(
        border: _hasBorder ? Border.all(color: Colors.grey) : null,
        borderRadius: BorderRadius.circular(15),
        color: _hasBorder ? null : const Color(0xffcae9ae),
      ),
      child: InkWell(
        onTap: () => setState(() {
          _hasBorder = !_hasBorder;
          _s = (int.parse(_s) + 1).toString();
        }),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _s,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.text2,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalenderTask extends StatelessWidget {
  final String timeline, title, desc;

  const CalenderTask({
    super.key,
    required this.timeline,
    required this.title,
    required this.desc,
  });

  String getAmPm(String timeline) {
    try {
      int hour = int.parse(timeline.split(':')[0]);
      return hour < 12 ? "AM" : "PM";
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                timeline,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                getAmPm(timeline),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Container(
            height: 70,
            width: 10,
            color: Color.fromARGB(
              255,
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(desc),
            ],
          ),
        ],
      ),
    );
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> events = [
    {
      "time": "07:00",
      "title": "CTDL & GT",
      "description": "Nguyễn Duy Phương",
    },
    {
      "time": "09:00",
      "title": "Lí thuyết thông tin",
      "description": "Phạm Văn Sự",
    },
    {
      "time": "13:00",
      "title": "Tư tưởng HCM",
      "description": "Phạm Thị Khánh",
    },
    {
      "time": "15:00",
      "title": "Toán rời rạc 2",
      "description": "Nguyễn Tất Thắng",
    },
  ];

  int currentIndex = 0;

  void switchTask() {
    setState(() {
      currentIndex = (currentIndex + 1) % events.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: switchTask,
            // child: const Icon(Icons.access_alarm),
          ),
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        CalenderBox(text1: "17", text2: "Mon"),
                        CalenderBox(text1: "18", text2: "Tue"),
                        CalenderBox(text1: "19", text2: "Wed"),
                        CalenderBox(text1: "20", text2: "Thu"),
                        CalenderBox(text1: "21", text2: "Fri"),
                        CalenderBox(text1: "22", text2: "Sat"),
                        CalenderBox(text1: "23", text2: "Sun"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  CalenderTask(
                    timeline: events[currentIndex]["time"],
                    title: events[currentIndex]["title"],
                    desc: events[currentIndex]["description"],
                  ),
                  Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

