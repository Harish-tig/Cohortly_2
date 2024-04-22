import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messagingapp/pages/forgotpassword.dart';
import 'package:messagingapp/pages/home.dart';
import 'package:messagingapp/pages/signup.dart';
import 'package:flutter/cupertino.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin{
  String email = "", password = "";
  TextEditingController useremailcontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "no-user-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("No user found for that Email",
                style: TextStyle(fontSize: 18.0, color: Colors.black))));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text("Wrong password",
                style: TextStyle(fontSize: 18.0, color: Colors.black))));
      }else {   //default exception
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(e.code,
                style: TextStyle(fontSize: 18.0, color: Colors.black))));
      }
    }
  }


  late AnimationController _controller;
  late Animation<Alignment> _topanimation;
  late Animation<Alignment> _bottomanimation;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _topanimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1,),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,),


      ],
    ).animate(_controller);

    _bottomanimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1,),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1,),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1,),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomLeft),
          weight: 1,),

      ],
    ).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(

        child: Stack(
          children: [
            AnimatedBuilder(
                animation: _controller, builder: (context,_){
              return Container(
                  height: MediaQuery.of(context).size.height / 4.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF7f30fe), Color(0xFF6380fb)],
                          begin: _topanimation.value,
                          end: _bottomanimation.value), //Linear Gradient
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width,
                              105.0))));
            }
            ), //Container //BoxDecoration
            Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Column(
                  children: <Widget>[
                    Center(
                        child: Text(
                          "SignIn",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold), //textstyle
                        )),
                    Center(
                        child: Text(
                          "Login to your account",
                          style: TextStyle(
                              color: Color(0xFFbbb0ff),
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500), //textstyle
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 20.0),
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.0),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      border: Border.all(width: 2.0,
                                          color: Colors.deepPurple.shade800)),
                                  child: TextFormField(
                                      controller: useremailcontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please Enter an Email";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Email",
                                          border: InputBorder.none,
                                          prefixIcon: Icon(
                                            Icons.mail_outline,
                                            color: Color(0xFF7f30fe),
                                          ))),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      border: Border.all(width: 2.0,
                                          color: Colors.deepPurple.shade800)),
                                  child: TextFormField(
                                    controller: userpasswordcontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter a Password";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Password",
                                        border: InputBorder.none,
                                        prefixIcon: Icon(
                                          Icons.password,
                                          color: Color(0xFF7f30fe),
                                        )),
                                    obscureText: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                                    },
                                    child: Container(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500),

                                      ),
                                    )),
                                SizedBox(
                                  height: 50.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {
                                        email = useremailcontroller.text;
                                        password = userpasswordcontroller.text;
                                      });
                                    }
                                    userLogin();
                                  },
                                  child: Center(
                                    child: Container(
                                      width: 130,
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF6380fb),
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                                "SignIn",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: Text(
                            " Sign Up Now!",
                            style: TextStyle(
                                color: Color(0xFF7f30fe),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
