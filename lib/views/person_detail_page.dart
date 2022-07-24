import 'package:flutter/material.dart';
import 'package:person_application/helper/person_dao.dart';
import 'package:person_application/model/person.dart';
import 'package:person_application/views/home_page.dart';

class PersonDetailPage extends StatefulWidget {
  Person person;
  PersonDetailPage({required this.person, Key? key}) : super(key: key);

  @override
  State<PersonDetailPage> createState() => _PersonDetailPageState();
}

class _PersonDetailPageState extends State<PersonDetailPage> {
  TextEditingController tfPersonName = TextEditingController();
  TextEditingController tfPersonNumber = TextEditingController();
  Future<void> update(
      int personId, String personName, String personNumber) async {
    await PersonDao.personUpdate(personId, personName, personNumber);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ));
  }

  @override
  void initState() {
    super.initState();
    var person = widget.person;
    tfPersonName.text = person.name;
    tfPersonNumber.text = person.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kisi Detay'),
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
          update(widget.person.id, tfPersonName.text, tfPersonNumber.text);
        },
        label: const Text("Guncelle"),
        backgroundColor: Colors.red,
        icon: const Icon(
          Icons.update,
          color: Colors.white,
        ),
      ),
    );
  }
}
