import 'package:flutter/material.dart';
import 'package:version1_0/view/events.dart';
import 'package:version1_0/view/messages.dart';
import 'package:version1_0/view/themeDetails.dart';
import '../services/httpService_theme.dart';
import 'package:version1_0/models/theme_model.dart';
//import 'package:version1_0/view/theme_detail.dart';

/*void _navigateToThemeDetails(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ThemeDetails());
}*/

class EventsThemePage extends StatelessWidget {
  final HttpService_theme httpService = HttpService_theme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(globalEvent.eventName),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: httpService.getEventThemes(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ThemeModel>> snapshot) {
          if (globalEventId == 0) {
            return NoEventSelected();
          } else if (!snapshot.hasData) {
            return ThemesNotAdded();
          } else if (snapshot.hasData) {
            List<ThemeModel>? themes = snapshot.data;
            return ListView(
              children: themes!
                  .map(
                    (ThemeModel theme) => Card(
                      color: Colors.lightBlue[50],
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
                                  title: Text(theme.themeName,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text("Theme ${theme.themeID}"),
                                  /*onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ThemeDetail(
                                        theme: theme,
                                      ),
                                    ),
                                  ),*/
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ThemeInfo(
                                        theme: theme,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                          /* ListTile(
                            /*leading: CircleAvatar(
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
                      ),*/
                            title: Text(theme.themeName),
                            subtitle: Text("Theme ${theme.themeID}"),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ThemeDetail(
                                  theme: theme,
                                ),
                              ),
                            ),
                          ),*/
                        ],
                      ),
                    ),
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



/*class EventsThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Event Themes"),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            /// first tile
            //leading: Icon(Icons.home),
            title: Text('Theme 1 | Theme Name'),
            onTap: () => {_navigateToThemeDetails(context)},
          ),
          Divider(height: 0.1, thickness: 0.5, indent: 20, endIndent: 20),
          ListTile(
            //leading: Icon(Icons.info),
            title: Text('Theme 2 | Theme Name'),
            //onTap: () => {_navigateToEventInfo(context)},
          ),
          Divider(height: 0.1, thickness: 0.5, indent: 20, endIndent: 20),
          ListTile(
            //leading: Icon(Icons.info),
            title: Text('Theme 3 | Theme Name'),
            //onTap: () => {_navigateToEventInfo(context)},
          ),
          Divider(height: 0.1, thickness: 0.5, indent: 20, endIndent: 20),
          ListTile(
            //leading: Icon(Icons.info),
            title: Text('Theme 4 | Theme Name'),
            //onTap: () => {_navigateToEventInfo(context)},
          ),
        ],
      ),
    );
  }
}*/
