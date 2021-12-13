import 'package:flutter/material.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class TopNavigation extends StatefulWidget {
  @override
  _TopNavigationState createState() => _TopNavigationState();
}

class _TopNavigationState extends State<TopNavigation> {
  int selectedIndex = 0;

  void changeTab() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // extendBody: true,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onTabChange: (int index) {
            selectedIndex = index;
            changeTab();
          },
          // showActiveButtonText: false,
          textStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          navigationBarButtons: const <NavigationBarButton>[
            NavigationBarButton(
              text: 'Tab 1',
              icon: Icons.people,
              backgroundGradient: LinearGradient(
                colors: <Color>[Colors.yellow, Colors.green, Colors.blue],
              ),
            ),
            NavigationBarButton(
              text: 'Tab 2',
              icon: Icons.star,
              backgroundGradient: LinearGradient(
                colors: <Color>[Colors.cyan, Colors.teal],
              ),
            ),
            NavigationBarButton(
              text: 'Tab 3',
              icon: Icons.settings,
              backgroundGradient: LinearGradient(
                colors: <Color>[Colors.green, Colors.yellow],
              ),
            )
          ],
        ),
      ),
    );
  }
}
