import 'package:flutter/material.dart';
import 'package:movie_app_2/filmler.dart';
import 'package:path/path.dart';

class details_page extends StatefulWidget {
  filmler film;


  details_page({required this.film});

  @override
  State<details_page> createState() => _details_pageState();
}

class _details_pageState extends State<details_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.film.film_ad),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              Image.asset("images/${widget.film.film_resim}"),
            Text(widget.film.film_yil.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text(widget.film.yonetmen.yonetmen_ad,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
          ],
        ),
      ),

    );
  }
}
