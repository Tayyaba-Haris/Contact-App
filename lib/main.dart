import 'package:flutter/material.dart';
import 'package:contactapp/about.dart';
import 'package:contactapp/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeSreen(),
        '/about': (context) => AboutScreen(),
      },
      //home: HomeSreen(),
    );
  }
}
