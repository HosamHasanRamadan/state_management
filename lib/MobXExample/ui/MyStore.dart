import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:state_managment/Api/photoApi.dart';
import 'package:state_managment/Models/Photo.dart';

part 'MyStore.g.dart';

class MyStore = _MyStore with _$MyStore;

abstract class _MyStore with Store {
  final api = PhotoApi();

  @observable
  String _filter = "";

  @observable
  bool _isDeleteable = false;

  set filter(String text) => _filter = text;

  String get filter => _filter;

  set isDeleteable(bool value) => _isDeleteable = value;

  bool get isDeleteable => _isDeleteable;

  @observable
  ObservableList<Photo> _photos = ObservableList<Photo>();

  List<Photo> get photos {
    return _photos.where((value) {
      if (filter == null || filter.isEmpty)
        return true;
      else
        return value.title.contains(filter);
    }).toList();
  }

  @action
  Future<void> getAllPhotos() async {
    final photos = await api.getAllphoto();
    _photos.addAll(photos);
  }

  @action
  Future<void> deletePhoto(Photo photo, BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    await api.deletePhotoById(photo.id);
    _photos.remove(photo);
    Navigator.pop(context);
  }
}
