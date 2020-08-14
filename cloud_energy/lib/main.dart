import 'package:cloud_energy/pages/top_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Energy',
      home: TopPage(),
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        accentColor: Colors.indigo[800],
        textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black87, fontSize: 16),
            bodyText2: TextStyle(color: Colors.purple),
            button: TextStyle(
                color: Colors.indigo[800],
                fontSize: 14,
                fontWeight: FontWeight.w600)),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
