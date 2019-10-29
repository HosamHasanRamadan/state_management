// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyStore on _MyStore, Store {
  final _$_filterAtom = Atom(name: '_MyStore._filter');

  @override
  String get _filter {
    _$_filterAtom.context.enforceReadPolicy(_$_filterAtom);
    _$_filterAtom.reportObserved();
    return super._filter;
  }

  @override
  set _filter(String value) {
    _$_filterAtom.context.conditionallyRunInAction(() {
      super._filter = value;
      _$_filterAtom.reportChanged();
    }, _$_filterAtom, name: '${_$_filterAtom.name}_set');
  }

  final _$_isDeleteableAtom = Atom(name: '_MyStore._isDeleteable');

  @override
  bool get _isDeleteable {
    _$_isDeleteableAtom.context.enforceReadPolicy(_$_isDeleteableAtom);
    _$_isDeleteableAtom.reportObserved();
    return super._isDeleteable;
  }

  @override
  set _isDeleteable(bool value) {
    _$_isDeleteableAtom.context.conditionallyRunInAction(() {
      super._isDeleteable = value;
      _$_isDeleteableAtom.reportChanged();
    }, _$_isDeleteableAtom, name: '${_$_isDeleteableAtom.name}_set');
  }

  final _$_photosAtom = Atom(name: '_MyStore._photos');

  @override
  ObservableList<Photo> get _photos {
    _$_photosAtom.context.enforceReadPolicy(_$_photosAtom);
    _$_photosAtom.reportObserved();
    return super._photos;
  }

  @override
  set _photos(ObservableList<Photo> value) {
    _$_photosAtom.context.conditionallyRunInAction(() {
      super._photos = value;
      _$_photosAtom.reportChanged();
    }, _$_photosAtom, name: '${_$_photosAtom.name}_set');
  }

  final _$getAllPhotosAsyncAction = AsyncAction('getAllPhotos');

  @override
  Future<void> getAllPhotos() {
    return _$getAllPhotosAsyncAction.run(() => super.getAllPhotos());
  }

  final _$deletePhotoAsyncAction = AsyncAction('deletePhoto');

  @override
  Future<void> deletePhoto(Photo photo, BuildContext context) {
    return _$deletePhotoAsyncAction
        .run(() => super.deletePhoto(photo, context));
  }
}
