import 'package:kisiler_app/data/entity/kisiler.dart';

class KisilerCevap {
  List<Kisiler> kisiler;
  int success;

  KisilerCevap({required this.kisiler, required this.success});

  factory KisilerCevap.fromJson(Map<String, dynamic> map) {
    var lis = map['kisiler'] as List;
    int suc = map['success'] as int;

    final listem = lis.map((e) {
      return Kisiler.fromJson(e);
    }).toList();

    return KisilerCevap(kisiler: listem, success: suc);
  }
}
