import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:person_application/model/person.dart';
import 'package:person_application/views/person_detail_page.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomePageListViewBuilder extends StatefulWidget {
  const HomePageListViewBuilder({
    Key? key,
    required this.personList,
  }) : super(key: key);

  final List<Person> personList;

  @override
  State<HomePageListViewBuilder> createState() =>
      _HomePageListViewBuilderState();
}

class _HomePageListViewBuilderState extends State<HomePageListViewBuilder> {
  Future<void> deletePerson(int id) async {
    debugPrint("$id kisi silindi");
    setState(() {});
  }

  @override
  Widget build(BuildContext bcontext) {
    return ListView.builder(
      itemCount: widget.personList.length,
      itemBuilder: (BuildContext context, int index) {
        var line = widget.personList[index];
        return SizedBox(
          height: 75,
          child: Card(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 15),
            color: Colors.white,
            elevation: 5,
            child: Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      AwesomeDialog(
                        context: bcontext,
                        animType: AnimType.SCALE,
                        dialogType: DialogType.ERROR,
                        body: Text(
                            "${line.name} Kisisini Silmek Istediginize Emin Misiniz?"),
                        btnOkOnPress: () {
                          deletePerson(line.id);
                        },
                        btnCancelOnPress: () {},
                      ).show();
                    },
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete_forever_sharp,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PersonDetailPage(person: line),
                          ));
                    },
                    backgroundColor: const Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.update_outlined,
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                      // flex: 2,
                      onPressed: (context) {
                        showTopSnackBar(
                          context,
                          const CustomSnackBar.success(
                              message: "Kopyalama Basarili"),
                          animationDuration: const Duration(seconds: 3),
                        );
                      },
                      backgroundColor: const Color(0xFF7BC043),
                      foregroundColor: Colors.white,
                      icon: Icons.copy),
                  SlidableAction(
                    onPressed: (context) {
                      showTopSnackBar(
                        context,
                        const CustomSnackBar.info(
                            message: "Indirme Islemi Yapiliyor..."),
                      );
                    },
                    backgroundColor: const Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.download,
                  ),
                ],
              ),
              child: ListTile(
                title: Center(child: Text("${line.name} : ${line.phone}")),
              ),
            ),
          ),
        );
      },
    );
  }
}
