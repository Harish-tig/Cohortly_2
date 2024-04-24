import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messagingapp/pages/signup.dart';

import '../service/auth.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      AuthMethods().getcurrentUser().then((user) {
        if (user != null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Text(
            'Cohortly',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Colors.purple),
          )
        ),
      ),
    );
  }
}
