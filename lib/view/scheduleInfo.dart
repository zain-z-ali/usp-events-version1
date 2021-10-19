import 'package:flutter/material.dart';

class ScheduleInfo extends StatelessWidget {
  const ScheduleInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Schedules',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Event Schedule')),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  // backing data
  final europeanCountries = [
    'Meeting 1',
    'Time:',
    'Meeting 2',
    'Time:',
    'Meeting 3',
    'Time:',
    'Meeting 4',
    'Time:',
    'Meeting 5',
    'Time:',
    'Meeting 6',
    'Time:',
    'Meeting 7',
    'Time:',
    'Meeting 8',
    'Time:',
    'Meeting 9',
    'Time:',
    'Meeting 10',
    'Time:',
  ];
  return ListView.builder(
    itemCount: europeanCountries.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(europeanCountries[index]),
      );
    },
  );
}
