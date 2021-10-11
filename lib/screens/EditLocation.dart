import 'package:flutter/material.dart';

class EditLocation extends StatefulWidget {
  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {

  void getData() async {
    await Future.delayed(Duration(seconds: 3), () {
      print ("after delayed");
    });

    print ("before delayed");
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Location"),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Text(
        "Edit Location Screen"
      ),
    );
  }
}
