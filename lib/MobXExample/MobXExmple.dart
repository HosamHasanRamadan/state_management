import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'ui/ListElement.dart';
import 'ui/MyStore.dart';
import 'ui/SearchAppBar.dart';

class MobXExample extends StatefulWidget {
  MobXExample({Key key}) : super(key: key);

  _MobXExampleState createState() => _MobXExampleState();
}

class _MobXExampleState extends State<MobXExample> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar().build(context),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final model = Provider.of<MyStore>(context);
    return GestureDetector(
      onLongPress: () => model.isDeleteable = !model.isDeleteable,
      child: Observer(
        builder: (_) => ListView(
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

  @override
  void afterFirstLayout(BuildContext context) {
    final model = Provider.of<MyStore>(context);
    model.getAllPhotos();
  }
}
