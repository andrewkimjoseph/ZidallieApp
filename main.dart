import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tester/Auth/mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCvGKZbUONUwVFEgeWFZ6ZtxAMFKLblipA",
          authDomain: "zidallieappproj.firebaseapp.com",
          databaseURL: "https://zidallieappproj-default-rtdb.firebaseio.com",
          projectId: "zidallieappproj",
          storageBucket: "zidallieappproj.appspot.com",
          messagingSenderId: "554891898209",
          appId: "1:554891898209:web:92ff0398154e5a997b2920",
          measurementId: "G-QL87SC5T4K"));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ));
  }
}
