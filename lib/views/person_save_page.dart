import 'package:flutter/material.dart';

class PersonSavePage extends StatefulWidget {
  const PersonSavePage({Key? key}) : super(key: key);

  @override
  State<PersonSavePage> createState() => _PersonSavePageState();
}

class _PersonSavePageState extends State<PersonSavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kisi Kayit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [],
        ),
      ),
    );
  }
}
