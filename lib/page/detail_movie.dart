import 'package:flutter/material.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({ Key? key }) : super(key: key);

  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: Colors.grey,)),
      ),
    );
  }
}