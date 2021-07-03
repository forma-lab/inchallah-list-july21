import 'package:flutter/material.dart';
import 'package:inchallahlist/screens/homePage.dart';
import 'package:inchallahlist/screens/loginPage.dart';
import 'package:inchallahlist/screens/registerPage.dart';
import 'package:inchallahlist/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: SplashScreen(),
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
