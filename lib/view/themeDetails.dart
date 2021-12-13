import 'package:flutter/material.dart';
import 'package:version1_0/models/theme_model.dart';
import 'package:version1_0/view/themeForum.dart';
import 'package:version1_0/view/theme_details.dart';

class ThemeInfo extends StatefulWidget {
  final ThemeModel theme;

  const ThemeInfo({Key? key, required this.theme}) : super(key: key);

  @override
  _ThemeInfo createState() => _ThemeInfo();
}

class _ThemeInfo extends State<ThemeInfo> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      ThemeDetail(theme: widget.theme),
      ThemeForum(
        theme: widget.theme,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Information"),
        //automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        //iconSize: 25, //changes size of icon
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'Theme Details',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_rounded),
            label: 'Theme Forum',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(size: 27),
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
