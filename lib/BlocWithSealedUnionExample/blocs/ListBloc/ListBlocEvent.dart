import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import 'package:sealed_unions_annotations/sealed_unions_annotations.dart';
import 'package:state_managment/Models/Photo.dart';

part 'ListBlocEvent.g.dart';

@Seal("ListEvent")
abstract class ListBlocEvent {
  @Sealed()
  void intializeList();
  @Sealed()
  void deleteItem(Photo photo);
  @Sealed()
  void filter(String filter);
}
