// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListBlocEvent.dart';

// **************************************************************************
// SealedUnionsGenerator
// **************************************************************************

class ListEvent extends Union3Impl<ListEventIntializeList, ListEventDeleteItem,
    ListEventFilter> {
  static final Triplet<ListEventIntializeList, ListEventDeleteItem,
          ListEventFilter> _factory =
      const Triplet<ListEventIntializeList, ListEventDeleteItem,
          ListEventFilter>();

  ListEvent._(
      Union3<ListEventIntializeList, ListEventDeleteItem, ListEventFilter>
          union)
      : super(union);

  factory ListEvent.intializeList() =>
      ListEvent._(_factory.first(ListEventIntializeList()));

  factory ListEvent.deleteItem(Photo photo) =>
      ListEvent._(_factory.second(ListEventDeleteItem(photo)));

  factory ListEvent.filter(String filter) =>
      ListEvent._(_factory.third(ListEventFilter(filter)));
}

class ListEventIntializeList {
  ListEventIntializeList();
}

class ListEventDeleteItem {
  final Photo photo;

  ListEventDeleteItem(this.photo);
}

class ListEventFilter {
  final String filter;

  ListEventFilter(this.filter);
}
