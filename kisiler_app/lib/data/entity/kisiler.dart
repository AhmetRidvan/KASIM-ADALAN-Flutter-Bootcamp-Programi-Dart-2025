class KisilerModel {
  String kisi_id;
  String kisi_ad;
  String kisi_tel;

  KisilerModel({
    required this.kisi_id,
    required this.kisi_ad,
    required this.kisi_tel,
  });

  factory KisilerModel.fromJson(Map<dynamic, dynamic> jsonData, String key) {
    return KisilerModel(
      kisi_id: key,
      kisi_ad: jsonData['kisi_ad'] as String,
      kisi_tel: jsonData['kisi_tel'] as String,
    );
  }
}
