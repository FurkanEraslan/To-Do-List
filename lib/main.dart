import 'package:flutter/material.dart';
import 'package:todo_app/screens/login_page.dart';
import 'package:todo_app/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'lib\screens\login_page.dart',
      routes: {
        'lib\screens\login_page.dart': (context) => LoginPage(),
        'lib\screens\home.dart': (context) => HomeScreen(),
      },
    );
  }
}
