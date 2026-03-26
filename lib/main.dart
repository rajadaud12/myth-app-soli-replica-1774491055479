import 'package:create_screen_flow_app/screens/home_screen.dart'; 
import 'package:create_screen_flow_app/utils/colors.dart'; 
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(padding: const EdgeInsets.only(top: 44.0, bottom: 34.0)), child: child!), 
      title: 'Dashboard',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(color: Colors.white),
      ),
      home: HomeScreen(),
    );
  }
}