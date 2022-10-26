import 'package:dio_project/features/dio_test/services/prefs.dart';
import 'package:dio_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/annoucements_store.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Prefs prefs = Prefs();

  final annoucementStore = getIt<AnnoucementStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Observer(
        builder: (context) {
          return content(context);
        },
      ),
    );
  }

  Widget content(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _textTitle(),
          _getButton(),
          _postButton(),
          _secondTitle(),
          _switchButton(),
        ],
      ),
    );
  }

  Widget _textTitle() => const Text('Teste API');

  Widget _getButton() => ElevatedButton(
        onPressed: () {
          annoucementStore.getAnnoucements();
        },
        child: const Text('TEST GET'),
      );

  Widget _postButton() => ElevatedButton(
        onPressed: () {
          annoucementStore.postAnnoucements();
        },
        child: const Text('TEST POST'),
      );

  Widget _secondTitle() => const Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text('userOfflineMode'),
      );

  Widget _switchButton() => Switch(
        activeColor: Colors.blue,
        value: annoucementStore.userOffline,
        onChanged: (value) {
          annoucementStore.setUserOffline(value);
        },
      );
}
