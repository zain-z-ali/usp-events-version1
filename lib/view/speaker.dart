import 'package:flutter/material.dart';
import 'package:version1_0/view/messages.dart';
import '../services/httpService_speaker.dart';
import 'package:version1_0/models/speaker_model.dart';
import 'package:version1_0/view/speaker_detail.dart';
import 'package:version1_0/view/navBar.dart';

import 'events.dart';

class PostsPage extends StatelessWidget {
  final HttpService_speaker httpService = HttpService_speaker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Speakers"),
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Text(globalEvent.eventName),
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
          future: httpService.getSpeakers(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Speaker>> snapshot) {
            if (globalEventId == 0) {
              return NoEventSelected();
            } else if (!snapshot.hasData) {
              return SpeakersNotAdded();
            } else if (snapshot.hasData) {
              List<Speaker>? speakers = snapshot.data;
              return ListView(
                children: speakers!
                    .map(
                      (Speaker speaker) => Card(
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
                                    ), //
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
      ),
    );
  }
}
