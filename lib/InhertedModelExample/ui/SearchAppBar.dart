import 'package:flutter/material.dart';
import 'package:state_managment/InhertedModelExample/MyInheritedModel.dart';

class SearchAppBar {
  final ValueChanged onChanged;
  final GestureTapCallback onTap;

  SearchAppBar({@required this.onChanged, @required this.onTap});

  AppBar build(BuildContext context) {
    final deleteable = MyInheritedModel.of(context).model.isDeleteable;
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 15),
        child: Divider(thickness: 10, color: Colors.black, height: 0),
      ),
      title: Container(
        color: Colors.white,
        child: TextField(
          onChanged: onChanged,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
              onTap: onTap,
              child: Icon(deleteable ? Icons.cancel : Icons.filter_list)),
        )
      ],
    );
  }
}
