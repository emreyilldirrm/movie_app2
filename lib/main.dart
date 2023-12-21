import 'package:flutter/material.dart';
import 'package:movie_app_2/category.dart';
import 'package:movie_app_2/category_D_A_O.dart';
import 'package:movie_app_2/filmler.dart';
import 'package:movie_app_2/home_page.dart';
import 'package:movie_app_2/yonetmenler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: category_page(),
    );
  }
}

class category_page extends StatefulWidget {


  @override
  State<category_page> createState() => _category_pageState();
}

class _category_pageState extends State<category_page> {

  Future<List<kategoriler>> show_all_category() async{
    var category_list = await category_D_A_O().show_all_category();

    return category_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Kategori Sayfası"),
      ),
      body: FutureBuilder<List<kategoriler>>(
        future:show_all_category() ,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var category_list=snapshot.data;

            return ListView.builder(
                itemCount: category_list!.length,
                itemBuilder: (context, index) {
                  var category = category_list[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => home_page(kategori: category),));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(category.kategori_ad)
                          ],
                        ),
                      ),
                    ),
                  );
                },)
            ;
          }else{
            return Center();
          }
        },
      ),

    );
  }
}
