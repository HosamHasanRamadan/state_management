import 'package:bloc/bloc.dart';
import 'package:state_managment/Api/photoApi.dart';
import 'package:state_managment/Models/Photo.dart';
import 'ListBlocEvent.dart';
import 'ListBlocState.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final api = PhotoApi();
  final cachedListOfData = <Photo>[];
  @override
  ListState get initialState => ListState.initial();

  @override
  void onTransition(Transition<ListEvent, ListState> transition) {
    super.onTransition(transition);
    print('.......................Transition.................');
  }

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    yield* event.join<Stream<ListState>>(
        (init) => _initState(),
        (deletePhoto) => _deletePhoto(deletePhoto.photo),
        (filter) => _filter(filter.filter));
  }

  Stream<ListState> _initState() async* {
    print("init");
    yield* state.join<Stream<ListState>>((init) async* {
      yield ListState.loading();
      final photos = await api.getAllphoto();
      cachedListOfData.addAll(photos);
      yield ListState.loaded(photos);
    }, null, null, null);
  }

  Stream<ListState> _deletePhoto(Photo photo) async* {
    if (state is ListStateLoaded) {
      final photos = (state as ListStateLoaded).photos;
      yield ListState.loading();
      await api.deletePhotoById(photo.id);
      yield ListState.loaded(photos.where((val) => val != photo).toList());
    }
  }

  Stream<ListState> _filter(String filter) async* {
    yield* state.join<Stream<ListState>>(null, null, (init) async* {
      yield ListState.loading();
      if (filter == null || filter.isEmpty)
        yield ListState.loaded(cachedListOfData);
      else {
        final photos = cachedListOfData.where((value) {
          if (filter == null || filter.isEmpty)
            return true;
          else
            return value.title.contains(filter);
        }).toList();
        yield ListState.loaded(photos);
      }
    }, null);
  }
}
