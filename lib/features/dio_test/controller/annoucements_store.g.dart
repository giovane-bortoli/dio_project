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
  String toString() {
    return '''
userOffline: ${userOffline},
announcementList: ${announcementList}
    ''';
  }
}
