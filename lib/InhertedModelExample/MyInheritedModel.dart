import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:state_managment/Models/Photo.dart';

enum Aspect {
  Delete,
  Filter,
  Photos,
}

class ModelInherited {
  String filter;
  bool isDeleteable;
  List<Photo> photos;
  ModelInherited(this.filter, this.isDeleteable, this.photos);
}

class MyInheritedModel extends InheritedModel<Aspect> {
  final ModelInherited model;
  const MyInheritedModel({
    Key key,
    @required this.model,
    @required Widget child,
  }) : super(key: key, child: child);
  static MyInheritedModel of(BuildContext context, {Aspect aspect}) {
    return InheritedModel.inheritFrom<MyInheritedModel>(context,
        aspect: aspect);
  }

  @override
  bool updateShouldNotify(MyInheritedModel oldWidget) {
    return (model.isDeleteable != oldWidget.model.isDeleteable) ||
        (model.filter != oldWidget.model.filter) ||
        (model.photos != oldWidget.model.photos);
  }

  @override
  bool updateShouldNotifyDependent(
      MyInheritedModel oldWidget, Set<Aspect> aspects) {
    print(aspects);
    return (aspects.contains(Aspect.Delete) &&
            oldWidget.model.isDeleteable != model.isDeleteable) ||
        (aspects.contains(Aspect.Filter) &&
            oldWidget.model.filter != model.filter);
  }
}
