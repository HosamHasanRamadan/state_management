import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:state_managment/Api/photoApi.dart';
import 'package:state_managment/InhertedModelExample/MyInheritedModel.dart';
import 'package:state_managment/InhertedModelExample/ui/SearchAppBar.dart';
import 'package:state_managment/Models/Photo.dart';

import 'ui/ListElement.dart';

class InheritedModelExample extends StatefulWidget {
  InheritedModelExample({Key key}) : super(key: key);

  _InheritedModelExampleState createState() => _InheritedModelExampleState();
}

class _InheritedModelExampleState extends State<InheritedModelExample>
    with AfterLayoutMixin<InheritedModelExample> {
  final api = PhotoApi();
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    getAllPhotos();
  }

  @override
  Widget build(BuildContext context) {
    final model = MyInheritedModel.of(context, aspect: Aspect.Delete).model;
    return Scaffold(
      appBar: SearchAppBar(
        onChanged: (text) => setState(() {
          model.filter = text;
        }),
        onTap: model.isDeleteable
            ? () => setState(() => model.isDeleteable = false)
            : () => showDialog(
                context: context,
                builder: (context) => Center(
                      child: FractionallySizedBox(
                        widthFactor: .8,
                        heightFactor: .5,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    )),
      ).build(context),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    final model = MyInheritedModel.of(context).model;
    return GestureDetector(
      onLongPress: () =>
          setState(() => model.isDeleteable = !model.isDeleteable),
      child: ListView(
        children: model.photos.where((value) {
          if (model.filter == null || model.filter.isEmpty)
            return true;
          else
            return value.title.contains(model.filter);
        }).map((value) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListElement(
              key: Key(value.id.toString()),
              url: value.url,
              title: value.title,
              onDelete: () async {
                deletePhoto(value);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  void getAllPhotos() async {
    final model = MyInheritedModel.of(context).model;
    final photos = await api.getAllphoto();
    model.photos = photos;
    setState(() {});
  }

  void deletePhoto(Photo photo) async {
    final model = MyInheritedModel.of(context).model;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    final deletedPhotoResult = await api.deletePhotoById(photo.id);
    model.photos.remove(photo);
    Navigator.pop(context);
    setState(() {});
    print(deletedPhotoResult.toJson());
  }
}
