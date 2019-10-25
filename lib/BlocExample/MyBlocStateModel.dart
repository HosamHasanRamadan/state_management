import 'package:equatable/equatable.dart';
import '../Models/Photo.dart';

class MyBlocStateModel extends Equatable {
  MyBlocStateModel(this.filter, this.isDeleteable, this.photos);
  final String filter;

  final bool isDeleteable;
  final List<Photo> photos;

  @override
  List<Object> get props => [filter, isDeleteable, photos];
}
