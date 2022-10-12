import 'package:flutter/material.dart';
import 'package:tester/pages/bookrides.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key, required this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Zidallie',
            style: TextStyle(fontFamily: 'Roboto'),
          ),
        ),
        body: Center(
          child: ElevatedButton.icon(
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
              size: 60,
            ),
            onPressed: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserRides(email: email)));
            }),
            label: const Text(
              'Book a ride',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ));
  }
}
