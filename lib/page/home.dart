import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('     Search...');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //appbar manual
          SliverAppBar(
            pinned: false,
            snap: false,
            title: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Welcome Angeline",
                      style: TextStyle(color: Colors.grey[300], fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Let's relax and watch a movie!",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            floating: true,
            backgroundColor: Colors.black,
            elevation: 0,
            actions: [
              Container(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                    ),
                  ))
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            // search
            GestureDetector(
              child: Container(
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.7,
                height: 42,
                child: Row(
                  children: [
                    Icon(
                      customIcon.icon,
                      color: Colors.grey[300],
                    ),
                    customSearchBar,
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  if (customIcon.icon == Icons.search) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = Text(
                      '     type in movie name...',
                    );
                  } else {
                    customIcon = const Icon(Icons.search);
                    customSearchBar = const Text('     Search...');
                  }
                });
              },
            ),
            // kategori
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  //judul
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: GoogleFonts.basic(
                            fontSize: 14, color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "See All >",
                          style: GoogleFonts.basic(
                              fontSize: 14, color: Colors.yellow[700]),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("data",
                          style: GoogleFonts.basic(
                              fontSize: 14, color: Colors.white)),
                      Text("data",
                          style: GoogleFonts.basic(
                              fontSize: 14, color: Colors.white)),
                      Text("data",
                          style: GoogleFonts.basic(
                              fontSize: 14, color: Colors.white)),
                      Text("data",
                          style: GoogleFonts.basic(
                              fontSize: 14, color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
            // Showing
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  //judul
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Showing this month",
                        style: GoogleFonts.basic(
                            fontSize: 20, color: Colors.white),
                      ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     "See All >",
                      //     style: GoogleFonts.basic(
                      //         fontSize: 14, color: Colors.yellow[700]),
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            Text(
              "Sliver",
              style: TextStyle(color: Colors.white, fontSize: 600),
            )
          ])),
        ],
      ),
    );
  }
}
