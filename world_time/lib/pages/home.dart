import 'package:flutter/material.dart';
import 'dart:async';

import 'package:world_time/services/world_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data["worldTime"].time);

    String bgImage;
    Color bgColor;
    Color textColor;
    // print(data["worldTime"].daytime);
    if (data["worldTime"].daytime == 0) {
      bgImage = "morning.jpg";
      bgColor = Colors.cyan[200];
      textColor = Colors.black87;
    }
    else if (data["worldTime"].daytime == 1) {
      bgImage = "evening.jpg";
      bgColor = Colors.orangeAccent[200];
      textColor = Colors.black87;
    }
    else {
      bgImage = "night.jpg";
      bgColor = Colors.purple[800];
      textColor = Colors.white;
    }

    // 計時器，每10秒抓取時間並更新Home
    Timer(Duration(seconds:10), (){
      setState(() {
        data["worldTime"].getTime();
        print("update data");
      });
    });

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit: BoxFit.cover,
            )
          ),
          child: Column(
            children: [
              SizedBox(height: 140,),
              FlatButton.icon(
                onPressed: () async {
                  try {
                    dynamic result = await Navigator.pushNamed(context, "/location");
                    setState(() {
                      if (result != null) {
                        data = result;
                      }
                    });
                  }
                  catch (e) {
                    print("error : $e");
                    setState(() {});
                  }
                },
                icon: Icon(
                  Icons.edit_location,
                  color: textColor,
                ),
                label: Text(
                    "Edit Location",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),

              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["worldTime"].location,
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                data["worldTime"].time,
                style: TextStyle(
                  fontSize: 60,
                  color: textColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
