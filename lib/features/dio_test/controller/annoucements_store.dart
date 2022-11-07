// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio_project/features/dio_test/models/annoucements_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';

import 'package:dio_project/features/dio_test/services/prefs.dart';
import 'package:dio_project/features/dio_test/services/services_interface.dart';
import 'package:dio_project/shared/Widgets/custom_snack_bar.dart';
import 'package:dio_project/shared/client/errors/error_exceptions.dart';
part 'annoucements_store.g.dart';

class AnnoucementStore = _AnnoucementStoreBase with _$AnnoucementStore;

abstract class _AnnoucementStoreBase with Store {
  Prefs prefs = Prefs();
  final ServiceInterface services;

  List<AnnoucementsModel> _initialList = [];

  _AnnoucementStoreBase({
    required this.services,
  });

  @observable
  bool userOffline = false;

  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @action
  void setUserOffline(bool value) => userOffline = value;

  Future<void> getAnnoucements() async {
    try {
      //init loading state
      final result = await services.getAnnoucements();
      await prefs.saveData(result);
    } on NotFoundException {
      throw 'Página não encontrada';
    } on InternalServerException {
      throw 'Internal server Error!';
    } on ForbiddenException {
      throw 'Forbidden Error!';
    } on GenericException {
      throw 'Generic Error!';
    } finally {
      //finish loading state
    }
  }

  Future<void> postAnnoucements() async {
    try {
      // init loading state
      await services.postAnnoucements();
    } on NotFoundException {
      throw 'Página não encontrada';
    } on InternalServerException {
      throw 'Internal server Error!';
    } on ForbiddenException {
      throw 'Forbidden Error!';
    } on GenericException {
      throw 'Generic Error!';
    } finally {
      //finish loading state
    }
  }

  @observable
  List<AnnoucementsModel> announcementList = [];

  //Método para filtrar pesquisa
  @action
  void updateList(String value) {
    announcementList = announcementList
        .where((element) =>
            element.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  @action
  void addItemList({
    required String name,
    required String title,
    required String description,
  }) {
    try {
      final AnnoucementsModel model = AnnoucementsModel(
        title: name,
        description: description,
        userName: name,
      );

      announcementList.insert(0, model);
    } catch (e) {
      throw e;
    }
  }

  @observable
  bool isFavorite = false;

  @action
  void setIsFavorite(bool value) => isFavorite = value;

  @action
  void addFavorite({required bool favorite}) {
    try {
      final AnnoucementsModel model = AnnoucementsModel(isFavorite: favorite);

      announcementList.add(model);
    } catch (e) {
      throw e;
    }
  }

  @action
  Future<void> loadAnnoucements() async {
    try {
      final result = await prefs.getData();
      _initialList = result;
      announcementList.addAll(result);
    } catch (e) {
      throw [];
    }
  }

  @action
  void clearFilter() {
    announcementList = _initialList;
  }

  @action
  Future<void> getPersistedData() async {
    final result = await prefs.getData();
    return announcementList.addAll(result);
  }
}
