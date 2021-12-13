import 'package:flutter/material.dart';
import 'package:version1_0/models/speaker_model.dart';
import 'package:version1_0/view/events.dart';

class SpeakerDetail extends StatelessWidget {
  final Speaker speaker;

  SpeakerDetail({required this.speaker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Speaker Details"),
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Text(globalEvent.eventName),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                Card(
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
                            child: Text(speaker.speakerName,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          )),
                      /*ListTile(
                        title: Text("Name"),
                        subtitle: Text(speaker.speakerName),
                      ),*/
                      ListTile(
                        title: Text("Profession/Field"),
                        subtitle: Text("${speaker.speakerProfession}"),
                      ),
                      ListTile(
                        title: Text("Associated Organisations"),
                        subtitle: Text(speaker.speakerOrg),
                      ),
                      ListTile(
                        title: Text("About"),
                        subtitle: Text("${speaker.speakerBio}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
