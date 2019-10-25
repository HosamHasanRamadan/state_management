import 'package:bloc/bloc.dart';
import 'package:state_managment/BlocExample/MyBlocEvent.dart';
import 'package:state_managment/BlocExample/MyBlocStateModel.dart';

import '../Api/photoApi.dart';
import '../Models/Photo.dart';

class MyBloc extends Bloc<MyBlocEvent, MyBlocStateModel> {
  final api = PhotoApi();
  final cachedListOfData = <Photo>[];
  @override
  MyBlocStateModel get initialState => MyBlocStateModel(
        "",
        false,
        <Photo>[],
      );

  @override
  void onEvent(MyBlocEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  Stream<MyBlocStateModel> mapEventToState(MyBlocEvent event) async* {
    if (event is LoadData) {
      yield* getAllPhotos();
    }
    if (event is Filter) {
      yield* filter(event.filter);
    }
    if (event is Editing) {
      yield MyBlocStateModel(
        state.filter,
        event.isEditing,
        state.photos,
      );
    }
    if (event is DeletePhoto) {
      yield* deletePhoto(event.photo);
    }
  }

  Stream<MyBlocStateModel> filter(String filter) async* {
    if (filter == null || filter.isEmpty)
      yield MyBlocStateModel(
        filter,
        state.isDeleteable,
        cachedListOfData,
      );
    else {
      final photos = cachedListOfData.where((value) {
        if (filter == null || filter.isEmpty)
          return true;
        else
          return value.title.contains(filter);
      }).toList();
      yield MyBlocStateModel(
        filter,
        state.isDeleteable,
        photos,
      );
    }
  }

  Stream<MyBlocStateModel> getAllPhotos() async* {
    final mystate = state;
    final photos = await api.getAllphoto();
    // cache the data
    cachedListOfData.addAll(photos);
    yield MyBlocStateModel(mystate.filter, mystate.isDeleteable, photos);
  }

  Stream<MyBlocStateModel> deletePhoto(Photo photo) async* {
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context) => Center(child: CircularProgressIndicator()));
    final mystate = state;
    await api.deletePhotoById(photo.id);
    print(cachedListOfData.remove(photo));

    final photos = mystate.photos.where((val) => val != photo).toList();
    // Navigator.pop(context);
    yield MyBlocStateModel(mystate.filter, mystate.isDeleteable, photos);
  }
}
