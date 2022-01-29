import 'package:bioskop_app/system/nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
      body: Column(
        children: [
          Text(
            "signed " + (user == null ? "out" : "in"),
            style: GoogleFonts.bebasNeue(fontSize: 16, color: Colors.blue),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    child: Text('Sign In'),
                    onPressed: user != null
                        ? null
                        : () async {
                            await _googleSignIn.signIn();
                            setState(() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Nav()));
                            });
                          }),
                ElevatedButton(
                    child: Text('Sign Out'),
                    onPressed: user == null
                        ? null
                        : () async {
                            await _googleSignIn.signOut();
                            setState(() {});
                          }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
