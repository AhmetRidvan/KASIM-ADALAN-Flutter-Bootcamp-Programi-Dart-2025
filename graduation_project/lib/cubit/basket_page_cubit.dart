import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/basket_item_model.dart';
import 'package:graduation_project/repo/repo.dart';

class BasketPageCubit extends Cubit<List<BasketItemModel>> {
  BasketPageCubit() : super(<BasketItemModel>[]);

  Repo r1 = Repo();

  Future<void> getBasketItems(String kullaniciAdi) async {
    emit(await r1.getBasketItems(kullaniciAdi));
  }

  Future<void> deleteItem(int yemekId, String kullaniciAdi) async {
    await r1.delete(yemekId, kullaniciAdi);
    getBasketItems(kullaniciAdi);
  }
}
