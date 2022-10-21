import 'dart:developer';
import 'package:dio_project/features/dio_test/models/post_annoucements_model.dart';

import 'package:dio_project/features/dio_test/services/services.dart';
import 'package:dio_project/shared/Widgets/custom_snack_bar.dart';
import 'package:dio_project/shared/client/dio_impl.dart';
import 'package:dio_project/shared/client/errors/error_exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'annoucements_store.g.dart';

class AnnoucementStore = _AnnoucementStoreBase with _$AnnoucementStore;

abstract class _AnnoucementStoreBase with Store {
  final services = Services();

  Future<void> getAnnoucements() async {
    try {
      //init loading state
      final result = await services.getAnnoucements();
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
