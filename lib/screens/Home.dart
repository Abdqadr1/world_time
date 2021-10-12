import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage = (data['isDayTime']) ? 'day.png': 'night.png';
    Color bgColor = (data['isDayTime']) ? Colors.blue : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, "/location");
                        setState(() {
                          data = {
                            'location': result['location'],
                            'flag': result['flag'],
                            'time':result['time'],
                            'isDayTime': result['isDayTime'],
                          };
                        });
                      },
                      icon: Icon(Icons.edit_location, color: Colors.grey,),
                      label: Text("Edit Location", style: TextStyle(
                        color: Colors.grey,
                      ),)
                  ),
                  SizedBox(height: 22.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(backgroundImage: AssetImage("assets/${data['flag']}"),),
                      SizedBox(width: 10,),
                      Text(
                          "${data['location']}",
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          color: Colors.white
                        ),
                      ),
                    ]
                  ),
                  SizedBox(height: 30),
                  Text(
                    data["time"],
                    style: TextStyle(
                      fontSize: 60, color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
