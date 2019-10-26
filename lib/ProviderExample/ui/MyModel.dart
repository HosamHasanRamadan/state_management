import 'package:flutter/material.dart';
import 'package:state_managment/Api/photoApi.dart';
import 'package:state_managment/Models/Photo.dart';

class MyModel with ChangeNotifier {
  String _filter = "";
  set filter(String text) {
    _filter = text;
    notifyListeners();
  }

  String get filter => _filter;

  bool _isDeleteable = false;
  set isDeleteable(bool value) {
    _isDeleteable = value;
    notifyListeners();
  }

  bool get isDeleteable => _isDeleteable;

  List<Photo> _photos = <Photo>[];
  List<Photo> get photos {
    return _photos.where((value) {
      if (filter == null || filter.isEmpty)
        return true;
      else
        return value.title.contains(filter);
    }).toList();
  }

  final api = PhotoApi();

  Future<List<Photo>> getAllPhotos() async {
    final photos = await api.getAllphoto();
    this._photos = photos;
    notifyListeners();
    return photos;
  }

  void deletePhoto(Photo photo, BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    await api.deletePhotoById(photo.id);
    _photos.remove(photo);
    Navigator.pop(context);
    notifyListeners();
  }
}
