import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tester/widgets/infocard.dart';

//our data

const name = "nelly";
const email = "nelly@gmail.com";
const phone = "071234567";
const location = "Nairobi";

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account details'),
        actions: <Widget>[
          TextButton.icon(
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: const Text(
                'Sign Out',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              onPressed: (() {
                FirebaseAuth.instance.signOut();
              })),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const Text(
              'Nelly Alili',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
            ),
            const SizedBox(
              height: 30,
            ),

            //We are creating a new widget

            InfoCard(text: "names", icon: Icons.person, onPressed: () {}),
            InfoCard(text: "phone", icon: Icons.phone, onPressed: () {}),
            InfoCard(text: "email", icon: Icons.email, onPressed: () {}),
            InfoCard(
                text: "location", icon: Icons.location_city, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
