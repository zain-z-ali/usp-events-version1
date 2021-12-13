import 'package:flutter/material.dart';
import 'package:version1_0/models/theme_model.dart';
import 'package:version1_0/view/events.dart';
//import 'package:version1_0/view/event_detail.dart';
//import 'package:version1_0/models/event_model.dart';
//import '../services/httpService_events.dart';

/*void _navigateToThemeForum(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ThemeForum(required this.theme)));
}*/

class ThemeDetail extends StatelessWidget {
  final ThemeModel theme;

  ThemeDetail({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(globalEvent.eventName),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1528731708534-816fe59f90cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWluaW1hbCUyMHdoaXRlJTIwYmFja2dyb3VuZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                            //shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(theme.themeName,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          )),
                      /*ListTile(
                        title: Text("Name"),
                        subtitle: Text(theme.themeName),
                      ),*/
                      ListTile(
                        title: Text("Description"),
                        subtitle: Text(
                            "${theme.themeID} This is some theme description. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."),
                      ),
                      ListTile(
                        title: Text("Sessions"),
                        subtitle: Text("session"),
                      ),
                      /*Container(
                        child: ElevatedButton(
                          child: Text('View Forum'),
                          //onPressed: () => {_navigateToThemeForum(context)},
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ThemeForum(
                                theme: theme,
                              ),
                            ),
                          ),
                        ),
                      ),*/
                      /*ListTile(
                        title: Text("About"),
                        subtitle: Text("${speaker.speakerBio}"),
                      ),*/
                    ],
                  ),
                ),
                /*Card(   //create card and display forum below theme details --is infinite currently update to contained
                  child: ThemeForum(),
                ),*/
              ],
            ),
          ),
        ));
  }
}

/*
class ThemeDetail extends StatelessWidget {
  final HttpService_event httpService = HttpService_event();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Details"),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.lightBlue[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text(
                  "Theme",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  "Theme Name",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Session 1",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  "Session Start Time: startTime \nSession End Time: endTime\nVenue: events.eventVenue \nSession Date: Date \nSession Chair: chairName",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                  child: ElevatedButton(
                child: Text('View Forum'),
                onPressed: () => {_navigateToThemeForum(context)},
              )),
            ],
          ),
        ),
      ),
    );
  }
}
*/