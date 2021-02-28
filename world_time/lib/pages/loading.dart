import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    // 初始化設定
    WorldTime instance = WorldTime(url: 'Asia/Taipei', location: 'Taiwan', flag: 'taiwan.png');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "worldTime": instance,
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
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitWave(
          color: Colors.blue[300],
          size: 80.0,
        ),
      ),
    );
  }
}
