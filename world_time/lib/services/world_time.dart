import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;  // location name for UI
  String time;      // the time in that location
  String flag;      // url to an asset flag icon
  String url;       // location url for api endpoint
  int daytime;   // 0 is morning, 1 is evening, 2 is night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try {
      // 爬取API下來
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      // print(data);

      // 分析資料
      String datetime = data["datetime"];
      String offset1 = data["utc_offset"].substring(0,3);
      String offset2 = data["utc_offset"].substring(4,6);

      // 建立Datetime物件
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

      // 建立時間屬性
      if (now.hour > 6 && now.hour < 16) {
        daytime = 0;  // morning
      }
      else if (now.hour >= 16 && now.hour < 20) {
        daytime = 1;  // evening
      }
      else {
        daytime = 2;  // night
      }
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print("caught ERROR: $e");
      time = "Could not get time data";
    }
  }
}