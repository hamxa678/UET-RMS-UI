import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web/screens/signup.dart';
import 'signin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        margin: EdgeInsets.symmetric(vertical: 70, horizontal: 70),
        height: 600,
        decoration: BoxDecoration(
         // boxShadow: [
           // BoxShadow(
         //     color: Colors.grey.withOpacity(0.53),
         //     spreadRadius: 2,
        //      blurRadius: 3,
        //      offset: Offset(0, 3), // changes position of shadow
        //    ),
        //  ],
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image(
                        width: 60,
                        height: 60,
                        image: AssetImage(
                          'images/uet.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'University Of Engineering And Technology, Peshawar',
                        style: TextStyle(
                        //  fontFamily: 'NerkoOne',
                          fontSize: 27,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      //eedrcxtyfvgbhnjnbvcxzazwsxdcfvgbhnjmk,mnbvcxszxcvgbnjmkn bvcxzsxdcfvgbnjm
                      NavButton(
                        text: 'Home',
                      ),
                      SizedBox(
                        width: 15,
                      ),

                      NavButton(
                        text: 'About Us',
                      ),
                      SizedBox(width: 15),
                      TabButton(
                        text: 'Sign In',
                        click: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()));
                          });
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      TabButton(
                        text: 'Sign Up',
                        click: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Result Managment',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    'System',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'The University of Engineering and Technology, Peshawar, \nformerly known as NWFP University of Engineering and Technology,\nis a public university located in Peshawar, \nKhyber Pakhtunkhwa, Pakistan',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        AppStore(
                          text: 'App Store  ',
                          icon: FontAwesomeIcons.apple,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        AppStore(
                          text: 'Google Play',
                          icon: FontAwesomeIcons.googlePlay,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  NavButton({@required this.text, this.click});
  final String text;
  final Function click;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  TabButton({@required this.text, this.click});
  final String text;
  final Function click;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        width: 110,
        height: 30,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.43),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF03c4a1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class AppStore extends StatelessWidget {
  AppStore({@required this.text, @required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.43),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.teal,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
