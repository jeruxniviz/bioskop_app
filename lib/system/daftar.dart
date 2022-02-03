import 'package:bioskop_app/system/login.dart';
import 'package:bioskop_app/system/nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Daftar extends StatefulWidget {
  const Daftar({Key? key}) : super(key: key);

  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GoogleSignInAccount? user = _googleSignIn.currentUser;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          shadowColor: Colors.black,
          title: Text(
            "Daftar",
            style: GoogleFonts.basic(fontSize: 22, color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Container(
                child: Image.asset(
                  'images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Daftar dengan Google'),
                          Icon(Icons.g_mobiledata)
                        ],
                      ),
                      onPressed: user != null
                          ? null
                          : () async {
                              await _googleSignIn.signIn();
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              });
                            })),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  "Atau",
                  style: GoogleFonts.basic(color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      style: GoogleFonts.basic(color: Colors.white),
                      controller: nameController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          labelText: 'Nama Pengguna',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      style: GoogleFonts.basic(color: Colors.white),
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          labelText: 'Kata Sandi',
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Daftar'),
                    onPressed: () {
                      print(nameController.text);
                      print(passwordController.text);
                    },
                  )),
              SizedBox(
                height: 4,
              ),
              Divider(
                color: Colors.white,
              ),
              Row(
                children: <Widget>[
                  Text(
                    " Memiliki Akun ?",
                    style: GoogleFonts.basic(color: Colors.white),
                  ),
                  TextButton(
                    child: const Text(
                      'Masuk Sekarang',
                      style: TextStyle(color: Colors.amber),
                    ),
                    onPressed: () {
                      //signup screen

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
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
