import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my first flutter"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.amber,
                child: Text("four"),
              ),
              Container(
                padding: EdgeInsets.all(30),
                color: Colors.cyan,
                child: Text("five"),
              ),
              Container(
                padding: EdgeInsets.all(40),
                color: Colors.deepPurpleAccent,
                child: Text("six"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.amber,
                child: Text("four"),
              ),
              Container(
                padding: EdgeInsets.all(30),
                color: Colors.cyan,
                child: Text("five"),
              ),
              Container(
                padding: EdgeInsets.all(40),
                color: Colors.deepPurpleAccent,
                child: Text("six"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.amber,
                child: Text("four"),
              ),
              Container(
                padding: EdgeInsets.all(30),
                color: Colors.cyan,
                child: Text("five"),
              ),
              Container(
                padding: EdgeInsets.all(40),
                color: Colors.deepPurpleAccent,
                child: Text("six"),
              ),
            ],
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("chick"),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}