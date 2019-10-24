import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:state_managment/Api/photoApi.dart';
import 'package:state_managment/ScopedModelExample/ui/ListElement.dart';
import 'ui/MyModel.dart';
import 'ui/SearchAppBar.dart';
import 'package:state_managment/Models/Photo.dart';

class ScopedModelExample extends StatefulWidget {
  ScopedModelExample({Key key}) : super(key: key);

  _ScopedModelExampleState createState() => _ScopedModelExampleState();
}

class _ScopedModelExampleState extends State<ScopedModelExample> {
  @override
  void initState() {
    super.initState();
    final model = ScopedModel.of<MyModel>(context);
    model.getAllPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar().build(context),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final model = ScopedModel.of<MyModel>(context);
    return GestureDetector(
      onLongPress: () => model.isDeleteable = !model.isDeleteable,
      child: ScopedModelDescendant<MyModel>(
        builder: (context, _, model) => ListView(
          children: model.photos.map((value) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListElement(
                key: Key(value.id.toString()),
                url: value.url,
                title: value.title,
                onDelete: () async {
                  model.deletePhoto(value, context);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
