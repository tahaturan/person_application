import 'package:flutter/material.dart';
import 'package:person_application/helper/person_dao.dart';
import 'package:person_application/views/home_page.dart';

class PersonSavePage extends StatefulWidget {
  const PersonSavePage({Key? key}) : super(key: key);

  @override
  State<PersonSavePage> createState() => _PersonSavePageState();
}

class _PersonSavePageState extends State<PersonSavePage> {
  TextEditingController tfPersonName = TextEditingController();
  TextEditingController tfPersonNumber = TextEditingController();

  Future<void> personSave(String personName, String personNumber) async {
    await PersonDao.addPerson(personName, personNumber);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kisi Kayit'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfPersonName,
                decoration: const InputDecoration(
                  hintText: "Kisi Adi",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                controller: tfPersonNumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Kisi Telefon",
                  prefixIcon: Icon(Icons.numbers),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          personSave(tfPersonName.text, tfPersonNumber.text);
        },
        backgroundColor: Colors.red,
        tooltip: "Kisi Kayit",
        icon: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: const Text("Kaydet"),
      ),
    );
  }
}
