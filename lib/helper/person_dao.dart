import 'package:person_application/helper/person_database.dart';
import 'package:person_application/model/person.dart';

class PersonDao {
  //*tum kisileri cektik
  static Future<List<Person>> showAllPerson() async {
    var db = await DatabaseHelper.dataBaseConnect();

    String sql = "SELECT * FROM kisiler";
    List<Map<String, dynamic>> maps = await db.rawQuery(sql);

    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Person(line["kisi_id"], line["kisi_ad"], line["kisi_tel"]);
    });
  }

//*arama kelimesine gore kisi arama
  static Future<List<Person>> personSearch(String searchWord) async {
    var db = await DatabaseHelper.dataBaseConnect();

    String sql = "SELECT * FROM kisiler WHERE kisi_ad like '%$searchWord%'";
    List<Map<String, dynamic>> maps = await db.rawQuery(sql);

    return List.generate(maps.length, (index) {
      var line = maps[index];
      return Person(line["kisi_id"], line["kisi_ad"], line["kisi_tel"]);
    });
  }

//*Kisi ekleme
  static Future<void> addPerson(String personName, String personNumber) async {
    var db = await DatabaseHelper.dataBaseConnect();

    Map<String, dynamic> informations = {};
    informations["kisi_ad"] = personName;
    informations["kisi_tel"] = personNumber;

    await db.insert("kisiler", informations);
  }

//* kisi guncelleme
  static Future<void> personUpdate(
      int personId, String personName, String personNumber) async {
    var db = await DatabaseHelper.dataBaseConnect();

    Map<String, dynamic> informations = {};
    informations["kisi_ad"] = personName;
    informations["kisi_tel"] = personNumber;

    await db.update("kisiler", informations,
        where: "kisi_id=?", whereArgs: [personId]);
  }

  //*Kisi Silme

  static Future<void> deletePerson(int personId) async {
    var db = await DatabaseHelper.dataBaseConnect();
    db.delete("kisiler", where: "kisi_id=?", whereArgs: [personId]);
  }
}
