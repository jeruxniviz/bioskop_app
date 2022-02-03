import 'package:bioskop_app/system/nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'daftar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(30),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Text(
              "Login",
              style: GoogleFonts.basic(fontSize: 22, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Login Via Google'),
                      Icon(Icons.g_mobiledata)
                    ],
                  ),
                  onPressed: user != null
                      ? null
                      : () async {
                          await _googleSignIn.signIn();
                          setState(() {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => Nav()));
                          });
                        })),
          SizedBox(
            height: 50,
          ),
          Row(children: [
            Divider(color: Colors.white,),Text("Atau",style: GoogleFonts.basic(color: Colors.white),),Divider()
          ],),
          Divider(color: Colors.white,),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      labelText: 'User Name',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  print(nameController.text);
                  print(passwordController.text);
                },
              )),
          Divider(
            color: Colors.white,
          ),
          Row(
            children: <Widget>[
              const Text(
                "Tidak memiliki akun ?",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                child: const Text(
                  'Daftar Sekarang',
                  style: TextStyle(color: Colors.amber),
                ),
                onPressed: () {
                  //signup screen
                  
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Daftar()));
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    ));
  }
}
