import 'package:dio_project/features/dio_test/services/get_announcements.dart';
import 'package:dio_project/features/dio_test/services/post_annoucements.dart';
import 'package:dio_project/main.dart';
import 'package:flutter/material.dart';

import '../controller/annoucements_store.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final annoucementStore = getIt<AnnoucementStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'API TEST',
            ),
            ElevatedButton(
              onPressed: () {
                annoucementStore.getAnnoucements();
              },
              child: const Text('TEST GET'),
            ),
            ElevatedButton(
              onPressed: () {
                PostAnnoucements().postAnnoucements();
              },
              child: const Text('TEST POST'),
            )
          ],
        ),
      ),
    );
  }
}
