import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String location;  // location name for UI
  String time;      // the time in that location
  String flag;      // url to an asset flag icon
  String url;       // location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
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
    time = now.toString();
  }
}