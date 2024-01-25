import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

int counter = 0;
String trollText = "";

class _MyAppState extends State<MyApp> {

  void _increment() {
    counter++;

    (counter >= 40) ?
      (counter >= 60) ?
        trollText = "😑Bro, enough. Go touch the grass!"
      : trollText = "🤨Bro, you've pressed this button ${counter} times. Don't you have anything else to do?"
    : "";
  }

  void _decrement() {
    if (counter > 0) {
      counter--;
      (counter >= 40) ? trollText = "😐Okay, you reduced the number, now what?" : null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Web App ",
      // theme: ThemeData(
      //   colorSchemeSeed: Color.fromARGB(255, 162, 162, 162),
      //   useMaterial3: false,
      // ),
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: _Header(),
              ),
              Flexible(
                flex: 8,
                child: _Body(),
              ),
              Flexible(
                flex: 1,
                child: _Footer(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Header() {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      width: double.maxFinite,
      height: double.maxFinite,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Your Flutter app is running. "+trollText),
      ),
    );
  }

  Widget _Body() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Value
          Text(counter.toString(),
            style: TextStyle(fontSize: 256),
          ),
          // Button
          Container(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                  onPressed: () {
                    setState(() {
                      _increment();
                    });
                  },
                  child: Text("+", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                  onPressed: () {
                    setState(() {
                      _decrement();
                    });
                  },
                  child: Text("-", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _Footer() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black, width: 0.5),
        )
      ),
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      height: double.maxFinite,
      width: double.maxFinite,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Pretty exciting huh?😎😏 ~khip01"),
      ),
    );
  }
}
