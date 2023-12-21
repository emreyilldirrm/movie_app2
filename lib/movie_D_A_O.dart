import 'package:movie_app_2/VeritabaniYardimcisi.dart';
import 'package:movie_app_2/category.dart';
import 'package:movie_app_2/filmler.dart';
import 'package:movie_app_2/yonetmenler.dart';

class movies_D_A_O {
  Future<List<filmler>>fetch_movies_by_filtered_ID_number(int kategori_id) async{
    var db =await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = $kategori_id");

    return List.generate(maps.length, (index) {
      var satir = maps[index];
      var k=kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var y=yonetmenler(satir["yonetmen_id"], satir["yonetmen_ad"]);

      var f=filmler(satir["film_id"], satir["film_ad"], satir["film_yil"], satir["film_resim"],k,y);
      return f;
    });


  }
}