import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kisiler_app/data/entity/kisiler.dart';

class KisilerdaoRepository {
  var collection = FirebaseFirestore.instance.collection('Kisiler');

  Future<void> save(String kisi_ad, String kisi_tel) async {
    final x = HashMap<String, dynamic>.from({
      'kisi_id': '',
      'kisi_ad': kisi_ad,
      'kisi_tel': kisi_tel,
    });
    collection.add(x);
  }

  Future<void> update(String kisi_id, String kisi_ad, String kisi_tel) async {
    final x = HashMap<String, dynamic>.from({
      'kisi_ad': kisi_ad,
      'kisi_tel': kisi_tel,
    });
    collection.doc(kisi_id).update(x);
  }

  Future<void> delete(String kisi_id) async {
    collection.doc(kisi_id).delete();          
  }
}
