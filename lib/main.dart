import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Voicecall extends StatefulWidget {
  @override
  _VoicecallState createState() => _VoicecallState();
}

class _VoicecallState extends State<Voicecall> {
  TextEditingController callcode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DinoMeet",
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.blue,
                    fontFamily: 'monospace',
                    fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(1),
                width: 200,
                child: TextField(
                  maxLength: 24,
                  cursorColor: Colors.blue,
                  cursorWidth: 0,
                  controller: callcode,
                  onChanged: (value) => print(value),
                ),
              ),
              RaisedButton(
                  child: Text("Join Call"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Voicecall(),
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
