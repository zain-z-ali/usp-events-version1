import 'package:flutter/material.dart';
import 'package:version1_0/view/navBar.dart';
//import 'package:version1_0/models/event_model.dart';
import '../services/httpService_events.dart';
import 'package:version1_0/view/events.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:version1_0/view/chatPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        dividerTheme: DividerThemeData(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HttpService_event httpEventService = HttpService_event();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('USP Events'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.message_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatPage();
              }));
            },
          )
        ],
      ),
      body: EventsPage(),
    );
  }
}
