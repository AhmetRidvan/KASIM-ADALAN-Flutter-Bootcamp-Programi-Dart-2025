import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/data/entity/kisiler.dart';
import 'package:kisiler_app/data/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<KisilerModel>> {
  AnasayfaCubit() : super(<KisilerModel>[]);

  KisilerdaoRepository k1 = KisilerdaoRepository();
  var collection = FirebaseFirestore.instance.collection('Kisiler');

  Future<void> getPeople() async {
    final list = <KisilerModel>[];

    collection.snapshots().listen((event) {
      var documents = event.docs;
      for() //5:35
    });
  }

  Future<void> ara(String name) async {}

  Future<void> delete(String kisi_id) async {
    await k1.delete(kisi_id);
    await getPeople();
  }
}
