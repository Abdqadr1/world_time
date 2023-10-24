import 'package:flutter/material.dart';
import 'package:world_time/actions/world_time.dart';

class EditLocation extends StatefulWidget {
  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {

  @override
  Widget build(BuildContext context) {

    List<WorldTime> locations = [
      WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
      WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
      WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
      WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
      WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria.png'),
      WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
      WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
      WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
      WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
      WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
      WorldTime(url: 'Asia/Baghdad', location: 'Baghdad', flag: 'iraq.png'),
    ];

    void updateTime(index) async {
      WorldTime worldTime = locations[index];
      await worldTime.getTime();
      Navigator.pop(context, {
        'location': worldTime.location,
        'flag': worldTime.flag,
        'time':worldTime.time,
        'isDayTime': worldTime.isDayTime,
        'dateString': worldTime.dateString
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Change Current Location"),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        centerTitle: false,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
          itemCount: locations.length,
          )
    );
  }
}
