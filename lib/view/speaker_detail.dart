import 'package:flutter/material.dart';
import 'package:version1_0/models/speaker_model.dart';

class SpeakerDetail extends StatelessWidget {
  final Speaker speaker;

  SpeakerDetail({required this.speaker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Speaker Details"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Name"),
                        subtitle: Text(speaker.speakerName),
                      ),
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
        ));
  }
}
