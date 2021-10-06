/*import 'package:flutter/material.dart';
import 'package:version1_0/view/theme_detail.dart';
import 'package:version1_0/models/theme_model.dart'; //as Theme;
import 'package:version1_0/models/event_model.dart';
import '../services/httpService_themes.dart';

class ThemePage extends StatelessWidget {
  final HttpService_theme httpService = HttpService_theme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Themes"),
        automaticallyImplyLeading: false, // removes back button
      ),
      body: FutureBuilder(
        future: httpService.getTheme(),
        builder: (BuildContext context, AsyncSnapshot<List<Theme>> snapshot) {
          if (snapshot.hasData) {
            List<Theme>? themes = snapshot.data;
            return ListView(
              children: themes!
                  .map(
                    (Theme theme) => Card(
                        color: Colors.lightBlue[50],
                        child: ListTile(
                          title: Text(Theme.themeName),
                          /*subtitle: Text(
                              '${event.eventTheme} \nStarts ${event.eventStartDate} - Ends ${event.eventEndDate}'),*/
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ThemeDetail(
                                theme: theme,
                              ),
                            ),
                          ),
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
