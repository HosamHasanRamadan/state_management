import '../Models/Photo.dart';

abstract class MyBlocEvent {}

class Filter extends MyBlocEvent {
  final String filter;
  Filter(this.filter);
}

class DeletePhoto extends MyBlocEvent {
  final Photo photo;
  DeletePhoto(this.photo);
}

class Editing extends MyBlocEvent {
  final bool isEditing;
  Editing(this.isEditing);
}

class LoadData extends MyBlocEvent {}
