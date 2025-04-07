class Kisiler {
  String kisiId;
  String kisiAd;
  String kisiTel;

  Kisiler({required this.kisiId, required this.kisiAd, required this.kisiTel});

  factory Kisiler.fromJson(Map<String, dynamic> map) {
    return Kisiler(
      kisiId: map['kisi_id'] as String,
      kisiAd: map['kisi_ad'] as String,
      kisiTel: map['kisi_tel'] as String,
    );
  }
}
