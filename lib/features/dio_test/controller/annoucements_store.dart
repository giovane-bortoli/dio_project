// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

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

  _AnnoucementStoreBase({
    required this.services,
  });

  @observable
  bool userOffline = false;

  @action
  void setUserOffline(bool value) => userOffline = value;

  Future<void> getAnnoucements() async {
    try {
      //init loading state
      final result = await services.getAnnoucements();
      final result2 = prefs.saveData(result);
      inspect(result2);
    } on NotFoundException {
      throw 'Página não encontrada';
    } on InternalServerException {
      throw const CustomSnackBar(message: 'Internal server Error!');
    } on ForbiddenException {
      throw const CustomSnackBar(message: 'Forbidden Error');
    } on GenericException {
      throw const CustomSnackBar(message: 'Generic Error');
    } finally {
      //finish loading state
    }
  }

  Future<void> postAnnoucements() async {
    try {
      // init loading state
      final result = await services.postAnnoucements();
      inspect(result);
    } on NotFoundException {
      throw const CustomSnackBar(message: 'Not Found!');
    } on InternalServerException {
      throw const CustomSnackBar(message: 'Internal server Error!');
    } on ForbiddenException {
      throw const CustomSnackBar(message: 'Forbidden Error');
    } on GenericException {
      throw const CustomSnackBar(message: 'Generic Error');
    } finally {
      //finish loading state
    }
  }
}
