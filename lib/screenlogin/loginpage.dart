import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:screen/blocks/auth_bloc.dart';
import 'package:screen/modules/constrains.dart';
import 'package:screen/screen/home.dart';
import 'package:screen/screen/homefb.dart';
//import 'package:assest';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _rmbme = false;

// Login Page Setup Widgets
  Widget _buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 15.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

//Pswd widget
  Widget _buildPaswd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 50.0,
          child: TextField(
            obscureText: true,
            //keyboardType: TextInputType.pas,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 15.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
                hintStyle: kHintTextStyle),
          ),
        ),
      ],
    );
  }

//Forget Password Widget
  Widget _buildForgPswdBut() {
    return Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
          onPressed: () {},
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Forgot Password?',
            style: kLabelStyle,
          ),
        ));
  }

//Remember me widget
  Widget _buildRemberme() {
    return Container(
      height: 20.0,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
                value: _rmbme,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _rmbme = value;
                  });
                }),
          ),
          Text(
            'Remember Me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

//Enter or Login button Widget
  Widget _buildLoginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.blue[400],
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

//Text widget
  Widget _buildOrOption() {
    return Column(
      children: [
        Text(
          '- OR - ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w100,
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Sign in With',
          style: kLabelStyle,
        ),
      ],
    );
  }

//Other Sign Option Widget
  Widget _buildSignupOption() {
    return GestureDetector(
      onTap: () => print('Sign Up Option'),
      child: RichText(
          text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have a Account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign Up ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }

  //StreamSubscription<User> logindata;
  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    authBloc.currentUser.listen((fbUser) {
      if (fbUser != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      }
    });
    super.initState();
  }

//Login Page setup
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF478DE0), //0xFF73AEF5
                      Color(0xFF478DE0), //0xFF61A4F1
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.0, 0.3, 0.6, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 80.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildEmail(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _buildPaswd(),
                      _buildForgPswdBut(),
                      _buildRemberme(),
                      _buildLoginButton(),
                      _buildOrOption(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomeFb(),
                                ),
                              ),
                              child: Container(
                                height: 60.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 6.0),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/facebook.jpg',
                                    ),
                                    //fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                authBloc.loginGoogle();
                              },
                              child: Container(
                                height: 60.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 2),
                                        blurRadius: 6.0),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/google.jpg',
                                    ),
                                    //fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //SignInButton(Buttons.Google,
                      // onPressed: () => authBloc.loginGoogle()),
                      SizedBox(
                        height: 34.0,
                      ),
                      _buildSignupOption(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
