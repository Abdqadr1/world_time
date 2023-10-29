import 'package:flutter/material.dart';

class MyDrawerScreen extends StatefulWidget {

  @override
  State<MyDrawerScreen> createState() => _MyDrawerScreenState();
}

class _MyDrawerScreenState extends State<MyDrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            backgroundColor: Colors.grey[200],
            title: Text(
              "Drawer Here",
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
          body: Center(
            child: Text(
              'Drawer here',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
