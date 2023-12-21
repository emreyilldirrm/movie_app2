import 'package:movie_app_2/VeritabaniYardimcisi.dart';
import 'package:movie_app_2/category.dart';

class category_D_A_O {
  
  Future<List<kategoriler>>show_all_category() async{
    var db =await VeritabaniYardimcisi.veritabaniErisim();
    
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kategoriler");

    return List.generate(maps.length, (index) {
      var satir = maps[index];

      return kategoriler(satir["kategori_id"], satir["kategori_ad"]);
    });
  }

}