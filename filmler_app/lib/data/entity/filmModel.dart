class Filmmodel {
  String id;
  String ad;
  String resim;
  int fiyat;
  Filmmodel({
    required this.id,
    required this.ad,
    required this.resim,
    required this.fiyat,
  });

  factory Filmmodel.fromJson(Map<dynamic, dynamic> jsonData, String key) {
    return Filmmodel(
      id: key,
      ad: jsonData['ad'] as String,
      resim: jsonData['resim'] as String,
      fiyat: jsonData['fiyat'] as int,
    );
  }
}
