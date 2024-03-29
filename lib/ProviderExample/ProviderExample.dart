import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/ListElement.dart';
import 'ui/MyModel.dart';
import 'ui/SearchAppBar.dart';

class ProviderExample extends StatefulWidget {
  ProviderExample({Key key}) : super(key: key);

  _ProviderExampleState createState() => _ProviderExampleState();
}

class _ProviderExampleState extends State<ProviderExample>
    with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar().build(context),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final model = Provider.of<MyModel>(context);
    return GestureDetector(
      onLongPress: () => model.isDeleteable = !model.isDeleteable,
      child: Consumer<MyModel>(
        builder: (context, model, _) => ListView(
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
    final model = Provider.of<MyModel>(context);
    model.getAllPhotos();
  }
}
