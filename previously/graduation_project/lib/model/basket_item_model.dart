class BasketItemModel {
  String sepet_yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;
  String yemek_siparis_adet;
  String kullanici_adi;

  BasketItemModel({
    required this.sepet_yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat,
    required this.yemek_siparis_adet,
    required this.kullanici_adi,
  });

  factory BasketItemModel.fromJson(Map<String, dynamic> jsonData) {
    return BasketItemModel(
      sepet_yemek_id: jsonData['sepet_yemek_id'] as String,
      yemek_adi: jsonData['yemek_adi'] as String,
      yemek_resim_adi: jsonData['yemek_resim_adi'] as String,
      yemek_fiyat: jsonData['yemek_fiyat'] as String,
      yemek_siparis_adet: jsonData['yemek_siparis_adet'] as String,
      kullanici_adi: jsonData['kullanici_adi'] as String,
    );
  }
}
