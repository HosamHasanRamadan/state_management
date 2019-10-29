import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_managment/MobXExample/ui/MyStore.dart';

class ListElement extends StatelessWidget {
  final String url;
  final String title;
  final Function onDelete;
  final bool isDeletable;
  final Function onDone;
  ListElement(
      {Key key,
      this.url,
      this.title,
      this.onDelete,
      this.onDone,
      this.isDeletable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<MyStore>(context);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Center(
        child: SizedBox(
          width: size.width * .9,
          height: size.height * .1,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  ClipOval(child: Image.network(url)),
                  SizedBox(width: 10),
                  Flexible(flex: 1, child: Text(title)),
                  Observer(
                    builder: (_) => Visibility(
                      visible: model.isDeleteable,
                      child: GestureDetector(
                        onTap: onDelete,
                        child: FittedBox(
                            fit: BoxFit.fitHeight, child: Icon(Icons.delete)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
