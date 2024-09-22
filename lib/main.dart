import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exit Dialog",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _getOutOfApp() {
    if (Platform.isIOS) {
      try {
        exit(0);
      } catch (e) {
        print(e);
      }
    } else {
      try {
        SystemNavigator.pop();
      } catch (e) {
        print(e);
      }
    }
  }

  exitDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: 150,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Are you sure to exit?",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => _getOutOfApp(),
                        child: Text("Yes"),
                      ),
                      VerticalDivider(width: 100),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("No"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitDialog(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Exit Dialog"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
      ),
    );
  }
}
