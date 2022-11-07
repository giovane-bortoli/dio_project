import 'package:dio_project/features/dio_test/controller/annoucements_store.dart';
import 'package:dio_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateAnnoucementView extends StatefulWidget {
  CreateAnnoucementView({Key? key}) : super(key: key);

  @override
  State<CreateAnnoucementView> createState() => _CreateAnnoucementViewState();
}

class _CreateAnnoucementViewState extends State<CreateAnnoucementView> {
  final annoucementStore = getIt<AnnoucementStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home');
              },
              icon: const Icon(Icons.arrow_back_ios))),
      body: content(context),
    );
  }

  Widget content(context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Observer(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _nameField(),
            _titleField(),
            _descriptionField(),
            _createButton(),
          ],
        );
      }),
    );
  }

  Widget _nameField() => TextField(
        decoration: InputDecoration(
          hintText: 'Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onChanged: (value) {
          annoucementStore.setName(value);
        },
      );

  Widget _titleField() => TextField(
        decoration: InputDecoration(
          hintText: 'Title',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onChanged: (value) {
          annoucementStore.setTitle(value);
        },
      );

  Widget _descriptionField() => TextField(
        decoration: InputDecoration(
          hintText: 'Description',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onChanged: (value) {
          annoucementStore.setDescription(value);
        },
      );

  Widget _createButton() => ElevatedButton(
        onPressed: () {
          //Método para adicionar a Lista
          annoucementStore.addItemList(
            name: annoucementStore.name,
            title: annoucementStore.title,
            description: annoucementStore.description,
          );
        },
        child: const Text('Create Annoucement'),
      );
}
