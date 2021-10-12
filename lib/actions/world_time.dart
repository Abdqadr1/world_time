import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // time in that location
  String flag; //location flag, url to the asset
  String url; // url for the api
  bool isDayTime; // true or false if daytime or not

  WorldTime ({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      // get time data
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(0, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Unable to get time";
      print("caught error: $e");
    }

  }
}