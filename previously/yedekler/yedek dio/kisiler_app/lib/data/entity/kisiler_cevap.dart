import 'package:kisiler_app/data/entity/kisiler.dart';

class KisilerCevap {
  // iç yapı ve dış yapı olmak üzere iki class'ımız var.
  List<Kisiler> kisiler;
  int success;

  KisilerCevap({required this.kisiler, required this.success});

   factory KisilerCevap.fromJson(Map<String, dynamic> jsonData) {
    var kisiler = jsonData['kisiler'] as List;
    var success = jsonData['success'] as int;

    List<Kisiler> tumListe =
        kisiler.map((e) {
          return Kisiler.fromJson(e);
        }).toList();

    return KisilerCevap(kisiler: tumListe, success: success);
  }
}

/*
{
	"kisiler": [{                   [ bunu KisilerCevap yapıcak içeriğini Kisiler yapıcak.
		"kisi_id": "18580",
		"kisi_ad": "yi\u011fit",
		"kisi_tel": "1234"
	}, {
		"kisi_id": "18581",
		"kisi_ad": "mert",
		"kisi_tel": "0000"
	}],
	"success": 1
}
*/
