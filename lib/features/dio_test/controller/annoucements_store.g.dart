// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annoucements_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnnoucementStore on _AnnoucementStoreBase, Store {
  late final _$userOfflineAtom =
      Atom(name: '_AnnoucementStoreBase.userOffline', context: context);

  @override
  bool get userOffline {
    _$userOfflineAtom.reportRead();
    return super.userOffline;
  }

  @override
  set userOffline(bool value) {
    _$userOfflineAtom.reportWrite(value, super.userOffline, () {
      super.userOffline = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_AnnoucementStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$titleAtom =
      Atom(name: '_AnnoucementStoreBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_AnnoucementStoreBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$announcementListAtom =
      Atom(name: '_AnnoucementStoreBase.announcementList', context: context);

  @override
  List<AnnoucementsModel> get announcementList {
    _$announcementListAtom.reportRead();
    return super.announcementList;
  }

  @override
  set announcementList(List<AnnoucementsModel> value) {
    _$announcementListAtom.reportWrite(value, super.announcementList, () {
      super.announcementList = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_AnnoucementStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$loadAnnoucementsAsyncAction =
      AsyncAction('_AnnoucementStoreBase.loadAnnoucements', context: context);

  @override
  Future<void> loadAnnoucements() {
    return _$loadAnnoucementsAsyncAction.run(() => super.loadAnnoucements());
  }

  late final _$getPersistedDataAsyncAction =
      AsyncAction('_AnnoucementStoreBase.getPersistedData', context: context);

  @override
  Future<void> getPersistedData() {
    return _$getPersistedDataAsyncAction.run(() => super.getPersistedData());
  }

  late final _$_AnnoucementStoreBaseActionController =
      ActionController(name: '_AnnoucementStoreBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_AnnoucementStoreBaseActionController.startAction(
        name: '_AnnoucementStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AnnoucementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_AnnoucementStoreBaseActionController.startAction(
        name: '_AnnoucementStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_AnnoucementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_AnnoucementStoreBaseActionController.startAction(
        name: '_AnnoucementStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_AnnoucementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserOffline(bool value) {
    final _$actionInfo = _$_AnnoucementStoreBaseActionController.startAction(
        name: '_AnnoucementStoreBase.setUserOffline');
    try {
      return super.setUserOffline(value);
    } finally {
      _$_AnnoucementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateList(String value) {
    final _$actionInfo = _$_AnnoucementStoreBaseActionController.startAction(
        name: '_AnnoucementStoreBase.updateList');
    try {
      return super.updateList(value);
    } finally {
      _$_AnnoucementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItemList(
      {required String name,
      required String title,
      required String description}) {
    final _$actionInfo = _$_AnnoucementStoreBaseActionController.startAction(
        name: '_AnnoucementStoreBase.addItemList');
    try {
      return super
          .addItemList(name: name, title: title, description: description);
    } finally {
      _$_AnnoucementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsFavorite(bool value) {
    final _$actionInfo = _$_AnnoucementStoreBaseActionController.startAction(
        name: '_AnnoucementStoreBase.setIsFavorite');
    try {
      return super.setIsFavorite(value);
    } finally {
      _$_AnnoucementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFavorite({required bool favorite}) {
    final _$actionInfo = _$_AnnoucementStoreBaseActionController.startAction(
        name: '_AnnoucementStoreBase.addFavorite');
    try {
      return super.addFavorite(favorite: favorite);
    } finally {
      _$_AnnoucementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilter() {
    final _$actionInfo = _$_AnnoucementStoreBaseActionController.startAction(
        name: '_AnnoucementStoreBase.clearFilter');
    try {
      return super.clearFilter();
    } finally {
      _$_AnnoucementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userOffline: ${userOffline},
name: ${name},
title: ${title},
description: ${description},
announcementList: ${announcementList},
isFavorite: ${isFavorite}
    ''';
  }
}
