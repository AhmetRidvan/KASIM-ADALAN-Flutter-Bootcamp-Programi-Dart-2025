import 'package:flutter/material.dart';
import 'package:using_sqlite/database_helper.dart';
import 'package:using_sqlite/models/person_model.dart';
import 'package:using_sqlite/persons_dao.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> showPersons() async {
    final list = await PersonsDao.allPersons();
    for (PersonModel p in list) {
      print(p.person_id);
      print(p.person_name);
      print(p.person_age);
    }
  }

  Future<void> filtered() async {
    List<PersonModel> lis = await PersonsDao.filtered('ze');
    for (final x in lis) {
      print(x.person_age);
      print(x.person_id);
      print(x.person_name);
    }
  }

  Future<void> addPerson(String name, int age) async {
    await PersonsDao.addPerson(name, age);
  }

  Future<void> takeOne() async {
    PersonModel p1 = await PersonsDao.takeOne(3);
    print(p1.person_age);
    print(p1.person_id);
  }

  Future<void> random() async {
    List<PersonModel> p1 = await PersonsDao.random();
    for (final x in p1) {
      print(x.person_id);
      print(x.person_name);
      print(x.person_age);
    }
  }

  Future<void> delete() async {
    PersonsDao.deletePerson(6);
    print('silindi');
  }

  Future<void> update() async {
    PersonsDao.update(9, 'Ashmir', 33);
  }

  Future<void> count() async {
    int sonuc = await PersonsDao.count('ss');
    print('cevap $sonuc');
  }

  @override
  void initState() {
    random();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
