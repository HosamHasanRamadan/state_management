import 'package:flutter/material.dart';
import 'package:state_managment/Api/photoApi.dart';
import 'package:state_managment/Models/Photo.dart';

import 'ui/ListElement.dart';

class StatefullWidgetExample extends StatefulWidget {
  StatefullWidgetExample({Key key}) : super(key: key);

  _StatefullWidgetExampleState createState() => _StatefullWidgetExampleState();
}

class _StatefullWidgetExampleState extends State<StatefullWidgetExample> {
  var isDeletable = false;
  List<Photo> photos = [];
  final api = PhotoApi();
  final controller = TextEditingController();
  var filter = '';

  @override
  void initState() {
    super.initState();
    getAllPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 15),
          child: Divider(thickness: 10, color: Colors.black, height: 0),
        ),
        title: Container(
          color: Colors.white,
          child: TextField(
            onChanged: (text) => setState(() {
              filter = text;
              print(filter);
            }),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
                onTap: isDeletable
                    ? () => setState(() => isDeletable = false)
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
                child: Icon(isDeletable ? Icons.cancel : Icons.filter_list)),
          )
        ],
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return GestureDetector(
      onLongPress: () => setState(() => isDeletable = !isDeletable),
      child: ListView(
        children: photos.where((value) {
          if (filter == null || filter.isEmpty)
            return true;
          else
            return value.title.contains(filter);
        }).map((value) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListElement(
              isDeletable: isDeletable,
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
    final photos = await api.getAllphoto();
    this.photos = photos;
    setState(() {});
  }

  void deletePhoto(Photo photo) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    final deletedPhotoResult = await api.deletePhotoById(photo.id);
    photos.remove(photo);
    Navigator.pop(context);
    setState(() {});
    print(deletedPhotoResult.toJson());
  }
}
