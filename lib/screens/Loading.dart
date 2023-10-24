import 'package:flutter/material.dart';
import 'package:world_time/actions/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: "Chicago", flag: "usa.png", url: "America/Chicago");
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time':worldTime.time,
      'isDayTime': worldTime.isDayTime,
      'dateString': worldTime.dateString
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
          child: SpinKitPouringHourGlass(
            color: Colors.white,
            size: 80.0,
          ),
      ),
    );
  }
}
