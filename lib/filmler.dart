import 'package:movie_app_2/category.dart';
import 'package:movie_app_2/yonetmenler.dart';

class filmler {
  int film_id;
  String film_ad;
  int film_yil;
  String film_resim;
  kategoriler kategori;
  yonetmenler yonetmen;

  filmler(this.film_id, this.film_ad, this.film_yil, this.film_resim,
      this.kategori, this.yonetmen);
}