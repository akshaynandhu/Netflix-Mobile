import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  AnimatedSplashScreen(
       animationDuration: Duration(seconds: 2),
        backgroundColor: Colors.black,
        splash: const Image(image: AssetImage('assets/images/splash.gif')),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset('assets/images/AKSHATHI.png',),
        //     Column(
        //       children: const [
        //         SizedBox(
        //           height: 30,
        //         ),
        //         Text('AKSHATHI',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        //         Padding(
        //           padding: EdgeInsets.only(left: 30.0),
        //           child: Text('...Tunes Your Soul',style: TextStyle(color: Colors.white,fontSize: 8),),
        //         )
        //       ],
        //     ),
        //
        //   ],
        // ),
        
        splashTransition: SplashTransition.slideTransition,
        nextScreen: Home(),
      ),
    );
  }
}

