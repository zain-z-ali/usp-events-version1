import 'package:flutter/material.dart';
import 'package:version1_0/main.dart';
import 'package:version1_0/models/theme_model.dart';
import 'package:version1_0/models/event_model.dart';
import '../services/httpService_themes.dart';

/*class ThemeDetail extends StatelessWidget {
  //final Theme theme;
  //Event event;
  final HttpService_theme httpService = HttpService_theme();

  //ThemeDetail({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Current Events"),
        automaticallyImplyLeading: false, // removes back button
      ),
      body: FutureBuilder(
        future: httpService.getTheme(),
        builder: (BuildContext context, AsyncSnapshot<List<Theme>> snapshot) {
          if (snapshot.hasData) {
            List<Theme>? events = snapshot.data;
            return ListView(
              children: events!
                  .map(
                    (Theme theme) => Card(
                        color: Colors.lightBlue[50],
                        child: ListTile(
                          title: Text(theme.themeName),
                          subtitle: Text(
                              '${event.eventName} \nStarts ${event.eventStartDate} - Ends ${event.eventEndDate} "Room: " ${event.eventVenue}'),
                          /*onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EventDetail(
                                event: event,
                              ),
                            ),
                          ),*/
                        )),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}*/
class EventsThemeForum extends State<MyHomePage> {
  //final EventThemeForum;
  //const ThemeForum({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Theme Discussion Forum',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Type here.',
                    ),
                  ),
                ),
                Container(
                    height: 30,
                    //width: 10.0,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Submit'),
                      onPressed: () {
                        print(nameController.text);
                      },
                    )),
              ],
            )));
  }
}
