import 'package:bioskop_app/page/home.dart';
import 'package:bioskop_app/page/movies.dart';
import 'package:bioskop_app/page/profile.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Movie(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Films"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        elevation: 0,
        iconSize: 25,
        selectedItemColor: Colors.green,
        showUnselectedLabels: false,
      ),
    );
  }
}
