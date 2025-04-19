import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/repo/repo.dart';

class DetailPageCubit extends Cubit<void> {
  DetailPageCubit() : super(0);

  Repo r1 = Repo();

  Future<void> addBasket(
    String yemek_adi,
    String yemek_resim_adi,
    int yemek_fiyat,
    int yemek_siparis_adet,
    String kullanici_adi,
  ) async {
    r1.addBasket(
      yemek_adi,
      yemek_resim_adi,
      yemek_fiyat,
      yemek_siparis_adet,
      kullanici_adi,
    );
  }
}
