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
    collection.snapshots().listen((event) {
      final list = <KisilerModel>[];
      var document = event.docs;
      for (var x in document) {
        final id = x.id;
        final rest = x.data();
        list.add(KisilerModel.fromJson(rest, id));
      }

      emit(list);
    });
  }

  Future<void> ara(String name) async {
    collection.snapshots().listen((event) {
      List<KisilerModel> kisiler = [];
      final x = event.docs;

      for (var z in x) {
        final id = z.id;
        final restOf = z.data();
        final kisiNesne = KisilerModel.fromJson(restOf, id);

        if (kisiNesne.kisi_ad.toUpperCase().contains(name.toUpperCase())) {
          kisiler.add(kisiNesne);
        }
      }
      emit(kisiler);
    });
  }

  Future<void> delete(String kisi_id) async {
    await k1.delete(kisi_id);
  }
}
