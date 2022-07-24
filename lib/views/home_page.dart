import 'package:flutter/material.dart';
import 'package:person_application/model/person.dart';
import 'package:person_application/widgets/homepage_listview_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool search = false;
  String searchWord = "";

  Future<List<Person>> showAllPersons() async {
    List<Person> personList = [];

    var k1 = Person(1, "Taha", "05494471997");
    var k2 = Person(2, "Selin", "0554895469");
    var k3 = Person(3, "Deneme", "11111111111");

    personList.add(k1);
    personList.add(k2);
    personList.add(k3);

    return personList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: search
            ? TextField(
                decoration:
                    const InputDecoration(hintText: "Kisi Ismini Giriniz"),
                onChanged: (searchResult) {
                  print("arama sonucu $searchResult");
                  setState(() {
                    searchWord = searchResult;
                  });
                },
              )
            : const Text('AnaSayfa'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                search = true;
              });
            },
            icon: search
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        search = false;
                        searchWord = "";
                      });
                    },
                    icon: const Icon(Icons.search_off),
                  )
                : IconButton(
                    onPressed: () {
                      setState(() {
                        search = true;
                      });
                    },
                    icon: const Icon(Icons.search),
                  ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: showAllPersons(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Person> personList = snapshot.data;
            return HomePageListViewBuilder(personList: personList);
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        tooltip: "Kisi Ekle",
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
