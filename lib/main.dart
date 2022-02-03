import 'package:bioskop_app/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kanesa Cinema',
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: GoogleFonts.basic(),
          button: GoogleFonts.basic(),
          subtitle1: GoogleFonts.basic(),
        ),
        scaffoldBackgroundColor: Colors.black,
        buttonTheme: ButtonThemeData(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            buttonColor: Colors.yellow[700]),
        primarySwatch: Colors.orange,
      ),
      home: Splash(),
    );
  }
}
