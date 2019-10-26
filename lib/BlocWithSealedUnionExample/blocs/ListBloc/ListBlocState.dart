import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import 'package:sealed_unions_annotations/sealed_unions_annotations.dart';
import 'package:state_managment/Models/Photo.dart';

part 'ListBlocState.g.dart';

@Seal("ListState")
abstract class ListBlocState {
  @Sealed()
  void initial();
  @Sealed()
  void loading();
  @Sealed()
  void loaded(List<Photo> photos);
  @Sealed()
  void loadingFailed(String errorMessage);
}
