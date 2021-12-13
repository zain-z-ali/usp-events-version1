import 'package:flutter/material.dart';
import 'package:version1_0/view/Session/sessionDetails.dart';
import 'package:version1_0/view/messages.dart';
import 'package:version1_0/services/httpService_session.dart';
import 'package:version1_0/models/session_model.dart';
import 'package:version1_0/view/events.dart';

class AttendingSession extends StatelessWidget {
  final HttpServiceAttendingSession httpService = HttpServiceAttendingSession();
  final int userID = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: NavBar(),
      /*appBar: AppBar(
        title: Text(globalEvent.eventName),
        automaticallyImplyLeading: false,
      ),*/
      body: FutureBuilder(
        future: httpService.getAttendingSessions(userID), //make userID dynamic
        builder: (BuildContext context, AsyncSnapshot<List<Session>> snapshot) {
          if (globalEventId == 0) {
            return NoEventSelected();
          } else if (!snapshot.hasData) {
            return SessionsNotAdded();
          } else if (snapshot.hasData) {
            List<Session>? sessions = snapshot.data;
            return ListView(
              children: sessions!
                  .map(
                    (Session session) => Card(
                      elevation: 5,
                      child: Column(
                        children: [
                          Container(
                              //height: 40,
                              //width: MediaQuery.of(context).size.width,
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
                                child: ListTile(
                                  //
                                  /*leading: CircleAvatar(
                                    child: ClipOval(
                                      child: Icon(Icons.circle),
                                    ),
                                  ),*/
                                  title: Text(session.sessionName),
                                  subtitle: Text(
                                      "Date: ${session.sessionDate} \nStarts ${session.sessionStartTime} - Ends ${session.sessionEndTime}"),
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SessionDetail(
                                        session: session,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          /* ListTile(
                            leading: CircleAvatar(
                              child: ClipOval(
                                child: Image.network(
                                  //'assets\images\generic_user.png',
                                  'https://static.vecteezy.com/system/resources/thumbnails/000/550/731/small/user_icon_004.jpg',
                                  width: 90,
                                  height: 90,
                                  fit: BoxFit
                                      .cover, //makes the image cover the whole circle
                                ),
                              ),
                            ),
                            title: Text(speaker.speakerName),
                            subtitle: Text(speaker.speakerProfession),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SpeakerDetail(
                                  speaker: speaker,
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ), //////
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
}
