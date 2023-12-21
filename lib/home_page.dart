import 'package:flutter/material.dart';
import 'package:movie_app_2/category.dart';
import 'package:movie_app_2/details_page.dart';
import 'package:movie_app_2/filmler.dart';
import 'package:movie_app_2/movie_D_A_O.dart';

class home_page extends StatefulWidget {
  kategoriler kategori;


  home_page({required this.kategori});

  @override
  State<home_page> createState() => _home_pageState();
}

Future<List<filmler>> show_all_movie(int kategori_id) async{
  var movie_list = await movies_D_A_O().fetch_movies_by_filtered_ID_number(kategori_id);
  return movie_list;
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.kategori.kategori_ad),
      ),
      body:FutureBuilder<List<filmler>>(
        future: show_all_movie(widget.kategori.kategori_id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var movie_list=snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5
              ),
              itemCount:movie_list!.length ,
              itemBuilder: (context, index) {
                var movie =movie_list[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => details_page(film: movie),));
                  },
                  child: Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("images/${movie.film_resim}"),
                          ),
                          Text(movie.film_ad),
                        ]),
                  ),
                );
              },
            );
          }else{
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Error: ${snapshot.error}"),
                ],
              ),
            );
          }
        },
      ),



    );
  }
}