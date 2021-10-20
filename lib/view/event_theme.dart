import 'package:flutter/material.dart';
import 'package:version1_0/view/theme_details.dart';
import '../services/httpService_theme.dart';
import 'package:version1_0/models/theme_model.dart';
//import 'package:version1_0/view/theme_detail.dart';
import 'package:version1_0/view/navBar.dart';

/*void _navigateToThemeDetails(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ThemeDetails());
}*/

class EventsThemePage extends StatelessWidget {
  final HttpService_theme httpService = HttpService_theme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Themes"),
      ),
      body: FutureBuilder(
        future: httpService.getEventThemes(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ThemeModel>> snapshot) {
          if (snapshot.hasData) {
            List<ThemeModel>? themes = snapshot.data;
            return ListView(
              children: themes!
                  .map(
                    (ThemeModel theme) => ListTile(
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
