import 'package:bioskop_app/system/daftar.dart';
import 'package:bioskop_app/system/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          shadowColor: Colors.black,
        ),
        backgroundColor: Colors.orange,
        body: Stack(
          children: [
            Container(
              child: ClipPath(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    color: Colors.black),
                clipper: CustomClipPath(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Kanesa Cinema",
                            style: GoogleFonts.basic(
                                fontSize: 30, color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "--Bioskop punya'e kanesa",
                            style: GoogleFonts.basic(
                                color: Colors.white, fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Image.asset('images/welcome.png'),
                  ),
                  Column(
                    children: [
                      Container(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 13),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color(0xffdf8e33).withAlpha(100),
                                    offset: Offset(2, 4),
                                    blurRadius: 8,
                                    spreadRadius: 2)
                              ],
                              color: Colors.white),
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xfff7892b)),
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Daftar()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 13),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Text(
                            'Daftar',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(25, 10));
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
