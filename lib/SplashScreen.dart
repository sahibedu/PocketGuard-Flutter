import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pocket_guard/HomeScreen.dart';

import 'ColorExtensions.dart';

/// Since Navigator Requires MaterialApp Context to work
/// Since during initState context Of _SplashScreenState is not having Material App
/// Therefore Dividing the Splash Screen into Main View And Child View
class SplashScreen extends StatelessWidget {
  final _gradientTopColor = HexColor.fromHex("#712E98");
  final _gradientBottomColor = HexColor.fromHex("#52A7EA");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [_gradientTopColor, _gradientBottomColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: _SplashScreenChild(),
      ),
    );
  }
}

class _SplashScreenChild extends StatefulWidget {
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<_SplashScreenChild> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getTextView("Pocket Guard", 32),
          getMiddleImage(),
          getTextView("Manage your personal expenses", 24),
        ],
      ),
    );
  }

  Widget getMiddleImage() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 42, 24, 12),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.white,
          ),
          Icon(
            Icons.cake,
            size: 120,
          )
        ],
      ),
    );
  }

  Widget getTextView(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.none,
          fontSize: fontSize),
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }
}
