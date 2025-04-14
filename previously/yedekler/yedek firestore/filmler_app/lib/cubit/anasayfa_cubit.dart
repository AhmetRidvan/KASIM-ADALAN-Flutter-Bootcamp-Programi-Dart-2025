import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmler_app/data/entity/filmModel.dart';
import 'package:filmler_app/repository/filmlerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Filmmodel>> {
  AnasayfaCubit() : super(<Filmmodel>[]);

  FilmlerdaoRepository f1 = FilmlerdaoRepository();

  var collection = FirebaseFirestore.instance.collection("Filmler");

  Future<void> filmleriYukle() async {
    collection.get().then((value) {
      List<Filmmodel> liste = [];
      final docs = value.docs;

      for (var doc in docs) {
        Filmmodel nesne = Filmmodel.fromJson(doc.data(), doc.id);
        liste.add(nesne);
      }
      emit(liste);
      print(liste);
    });
  }
}
