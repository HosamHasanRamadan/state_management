// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListBlocState.dart';

// **************************************************************************
// SealedUnionsGenerator
// **************************************************************************

class ListState extends Union4Impl<ListStateInitial, ListStateLoading,
    ListStateLoaded, ListStateLoadingFailed> {
  static final Quartet<ListStateInitial, ListStateLoading, ListStateLoaded,
          ListStateLoadingFailed> _factory =
      const Quartet<ListStateInitial, ListStateLoading, ListStateLoaded,
          ListStateLoadingFailed>();

  ListState._(
      Union4<ListStateInitial, ListStateLoading, ListStateLoaded,
              ListStateLoadingFailed>
          union)
      : super(union);

  factory ListState.initial() =>
      ListState._(_factory.first(ListStateInitial()));

  factory ListState.loading() =>
      ListState._(_factory.second(ListStateLoading()));

  factory ListState.loaded(List<Photo> photos) =>
      ListState._(_factory.third(ListStateLoaded(photos)));

  factory ListState.loadingFailed() =>
      ListState._(_factory.fourth(ListStateLoadingFailed()));
}

class ListStateInitial {
  ListStateInitial();
}

class ListStateLoading {
  ListStateLoading();
}

class ListStateLoaded {
  final List<Photo> photos;

  ListStateLoaded(this.photos);
}

class ListStateLoadingFailed {
  ListStateLoadingFailed();
}
