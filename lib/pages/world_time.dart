import 'dart:ffi';

import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String flag;
  String url;
  double size;
  bool isDaytime = true;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{
    int i = 2;
    while(i>0)
    {
      try {
        Response response =
            await get("https://worldtimeapi.org/api/timezone/$url");
        Map data = jsonDecode(response.body);

        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);

        print('Datetime : $datetime');
        //print(datetime);
        print(offset);

        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
        print('NOW: $now');

        time = now.toString();
        size = 66.0;
        String date = time.substring(0, 10);
        print('Date: $date');

        isDaytime = now.hour > 6 && now.hour < 19 ? true : false;

        time = DateFormat.jm().format(now);
        i=0;
      } catch (e) {
        print('Error : $e');
        time = 'Could Not Get Time Data!!';
        size = 30.0;
        i--;
      }
    }
  }

}

