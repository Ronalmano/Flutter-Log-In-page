//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:screen/screenlogin/loginpage.dart';
//import 'package:screen/screenlogin/signin.dart';
import 'dart:async';

//import 'package:screen/wrapper.dart';

class SpalshScreen extends StatefulWidget {
  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    var d = Duration(seconds: 6);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return LogIn();
        },
      ), (route) => false);
    });
    super.initState();
    //Timer(Duration(seconds: 5), () => print('Screeen'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wallpaper.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 15.0)),
                    Text(
                      'Booting   Up...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
