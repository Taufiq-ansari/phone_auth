import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String title = "";
   HomePage({super.key, required title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text("home"))],
        ),
      ),
    );
  }
}
