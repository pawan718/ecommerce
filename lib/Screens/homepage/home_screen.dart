import 'package:ecommerce/Screens/homepage/home_page.dart';
import 'package:ecommerce/Screens/homepage/notification_screen.dart';
import 'package:ecommerce/Screens/profile/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'orders_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    NotificationScreen(),
    Orders(),
    Profile(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/Home.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/notificationbing.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/Bookmark.svg'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/Person.svg'),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
      ),
      backgroundColor: const Color(0xffF5F5F5),
      body: _widgetOptions.elementAt(_selectedIndex),
    ));
  }
}
