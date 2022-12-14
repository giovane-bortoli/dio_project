import 'package:dio_project/main.dart';
import 'package:dio_project/shared/utils/app_formaters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/annoucements_store.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final annoucementStore = getIt<AnnoucementStore>();
  @override
  void initState() {
    loadAnnoucements();
    super.initState();
  }

  Future<void> loadAnnoucements() async {
    await annoucementStore.loadAnnoucements();
  }

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
    return SingleChildScrollView(
      child: Observer(builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textTitle(),
              _getButton(),
              _postButton(),
              _secondTitle(),
              _switchButton(),
              _buttonGetPersistedData(),
              _favoriteButton(),
              _searchField(),
              _listPersistedData(),
            ],
          ),
        );
      }),
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

  //salvar o estado true ou false no shared preference
  Widget _switchButton() => Switch(
        activeColor: Colors.blue,
        value: annoucementStore.userOffline,
        onChanged: (value) {
          annoucementStore.setUserOffline(value);
        },
      );

  Widget _buttonGetPersistedData() => Row(
        children: [
          ElevatedButton(
            onPressed: () {
              annoucementStore.getPersistedData();
            },
            child: const Text('GET PERSISTED DATA'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/createAnnoucement');
            },
            child: const Text('Create Annoucement'),
          ),
        ],
      );

  void _handleChanged(String value) {
    if (value.isEmpty) {
      annoucementStore.clearFilter();
    } else {
      annoucementStore.updateList(value);
    }
  }

  Widget _favoriteButton() => ElevatedButton(
        onPressed: () {
          ListView.builder(
            itemCount: annoucementStore.favoriteList.length,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int data) {
              final announcement = annoucementStore.announcementList[data];

              return Column(
                children: [
                  Card(
                    shadowColor: Colors.black,
                    elevation: 5,
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            annoucementStore.setIsFavorite(true);
                            annoucementStore.addItemList(announcement);
                          },
                          icon: Icon(
                            Icons.star_border_outlined,
                            color: annoucementStore.isFavorite
                                ? Colors.yellow
                                : Colors.black,
                          ),
                        ),
                        Text(announcement.title.toString()),
                        Text(announcement.description.toString()),
                        Text(
                            'Data de cria????o: ${formatHour(DateTime.parse(announcement.createdAt!))}'),
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
        child: const Text('Favorite List'),
      );
  Widget _searchField() => TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onChanged: _handleChanged,
      );

  Widget _listPersistedData() => ListView.builder(
        itemCount: annoucementStore.announcementList.length,
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int data) {
          final announcement = annoucementStore.announcementList[data];

          return Column(
            children: [
              Card(
                shadowColor: Colors.black,
                elevation: 5,
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        annoucementStore.setIsFavorite(true);
                        annoucementStore.addItemList(announcement);
                        annoucementStore.setIsFavorite(true);
                      },
                      icon: Icon(
                        Icons.star_border_outlined,
                        color: annoucementStore.isFavorite
                            ? Colors.yellow
                            : Colors.black,
                      ),
                    ),
                    Text(announcement.title.toString()),
                    Text(announcement.description.toString()),
                    Text(
                        'Data de cria????o: ${formatHour(DateTime.parse(annoucementStore.announcementList[data].createdAt!))}'),
                  ],
                ),
              )
            ],
          );
        },
      );
}
