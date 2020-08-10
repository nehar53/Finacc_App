import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

//import 'package:finacc/UI/side_menu.dart';
import 'package:finacc/main.dart';
import 'package:flutter/cupertino.dart';
//import 'package:finacc/UI/purchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      print("DONE LOADING PROCEED TO NEXT SCREEN");
      Navigator.of(context).pop();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MyHomePage(title: 'DashBoard'),
          ));
    });
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'F',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 60,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'IN',
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
            TextSpan(
              text: 'ACC',
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
              color: Colors.orange[900],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80.0,
                            child: Icon(
                              Icons.shopping_cart,
                              size: 160.0,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 20.0)),
                          SizedBox(height: 70),
                          _title(),

                          //  CircularProgressIndicator(backgroundColor: Colors.white,)
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
