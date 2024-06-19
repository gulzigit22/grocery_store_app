import 'package:flutter/material.dart';
import 'package:grocery_store_app/page/fist_screen/first_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:grocery_store_app/page/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: _isFirstTimeOpen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.data == true) {
              return const FirstScreen();
            } else {
              return const HomePage();
            }
          }
        },
      ),
    );
  }

  Future<bool> _isFirstTimeOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time_open') ?? true;
    if (isFirstTime) {
      await prefs.setBool('first_time_open', false);
    }
    return isFirstTime;
  }
}
