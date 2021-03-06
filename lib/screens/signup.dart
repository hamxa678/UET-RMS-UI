import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/constants.dart';
import 'package:web/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
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
                                image: AssetImage('images/bs2.png'),
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
                                        left: 20, bottom: 10),
                                    child: Text(
                                      'Create Your Account',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(labelText: 'Name',),
                                              obscureText: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(labelText: 'Surname',),
                                              obscureText: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  TextField(
                                    decoration: InputDecoration(labelText: 'Email',),
                                    obscureText: false,
                                    onChanged: (value){
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                  ),


                                  TextField(
                                    decoration: InputDecoration(labelText: 'Password',),
                                    obscureText: true,
                                    onChanged: (value){
                                      setState(() {
                                        passw = value;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
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
                                      height: 40,
                                      minWidth: 150,
                                      splashColor: Color(0xFF03c4a1),
                                      child: Text(
                                        'Create Account',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Color(0xFF03c4a1),
                                      onPressed: ()async{
                                      try{
                                        final newuser= await _auth.createUserWithEmailAndPassword(email: email, password: passw);
                                        if(newuser != Null){
                                          Navigator.pushNamed(context, "HomePage");
                                        }
                                      }
                                      catch(e){
                                        print(e);
                                      }
                                      },
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
                'Already on board? Let us take you to ',
                style: kNormalTextStyle,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Container(
                  child: Text(
                    'Sign In!',
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

class BuildButton extends StatelessWidget {
  BuildButton({@required this.colour, this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){

      },
      child: Center(
        child: Container(
          height: 40,
          width: 150,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.53),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: colour,
            borderRadius: BorderRadius.circular(100),
          ),
          child: cardChild,
        ),
      ),
    );
  }
}

class BuildTextField extends StatelessWidget {
  BuildTextField({this.hint});
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.0,
                color: Color(0xFF03c4a1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 0.0,
                color: Color(0xFF03c4a1),
              ),
            ),
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
