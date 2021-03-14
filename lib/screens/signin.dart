import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/constants.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email;
  String passw;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Color(0xFF03c4a1),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 580,
              width: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.13),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/bg2.png'),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Container(
                              padding: EdgeInsets.all(60.0),
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 40),
                                    child: Text(
                                      'Sign in to Your Account',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(labelText: 'Email',),
                                    onChanged: (value){
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                    obscureText: false,

                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextField(
                                    decoration: InputDecoration(labelText: 'Password',),
                                    onChanged: (value){
                                      setState(() {
                                        passw = value;
                                      });
                                    },
                                    obscureText: true,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      'I\'ve read and agreed to Terms of service and privacy policy',
                                      textAlign: TextAlign.center,
                                      style: kNormalTextStyle,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                      onPressed: () async {
                                        if(_formKey.currentState.validate()){
                                          dynamic result = await _auth.signInWithEmailAndPassword(email: email, password: passw);
                                          if(result == null) {
                                            setState(() {
                                              error = 'Could not sign in with those credentials';
                                            });
                                          }
                                        }
                                      },
                                      height: 40,
                                      minWidth: 150,
                                      splashColor: Color(0xFF03c4a1),
                                      child: Text(
                                      'Sign In',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                      color: Color(0xFF03c4a1),

                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an Account? ',
                style: kNormalTextStyle,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Container(
                  child: Text(
                    'Sign Up!',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: Color(0xFF03c4a1)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
