//import 'dart:async';

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:html';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import 'package:screen/blocks/auth_bloc.dart';
import 'package:screen/screenlogin/loginpage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  var rand = new Random().nextInt(100);
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    authBloc.currentUser.listen((fbUser) {
      if (fbUser == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LogIn(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      backgroundColor: Color(0xFF398AE5),
      appBar: AppBar(
        title: Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Color(0xFF61A4F1),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: StreamBuilder<User>(
            stream: authBloc.currentUser,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: NetworkImage(
                          snapshot.data.photoURL.replaceFirst('s96', 's400')),
                    ),
                  ),
                  Divider(
                    color: Colors.blue[800],
                    height: 60.0,
                  ),
                  Text(
                    'NAME',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    snapshot.data.displayName,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'PHONE NUMBER',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '9650030XXX',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(
                    'CURRENT NINJA LEVEL',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '$rand',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        snapshot.data.email,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 1.0,
                        ),
                      )
                    ],
                  ),
                  SignInButton(
                    Buttons.Google,
                    text: 'Sign Out Button',
                    onPressed: () {
                      authBloc.logout();
                      //Navigator.pop(context);
                    },
                  )
                ],
              );
            }),
      ),
    );
  }
}
