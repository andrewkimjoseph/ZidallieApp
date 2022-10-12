import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tester/pages/account.dart';
import 'package:tester/pages/notification.dart';
import 'package:tester/pages/home.dart';
import 'package:tester/pages/bookrides.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.email});

  final String? email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigatebottombar(int index) {
    setState(() {
      _selectedIndex = index;

      final user = FirebaseAuth.instance.currentUser;
    });
  }

  final List<Widget> _pages = [
    const UserHome(email: email),
    UserRides(email: email),
    UserChat(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _navigatebottombar,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Book Rides',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: 'Notifications'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account'),
            ]));
  }
}
