import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'MyStore.dart';

class SearchAppBar {
  AppBar build(BuildContext context) {
    final model = Provider.of<MyStore>(context);
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 15),
        child: Divider(thickness: 10, color: Colors.black, height: 0),
      ),
      title: Container(
        color: Colors.white,
        child: TextField(
          onChanged: (text) => onChanged(text, model),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () => onTap(model, context),
            child: Observer(
              builder: (_) {
                final model = Provider.of<MyStore>(context);
                return Icon(
                  model.isDeleteable ? Icons.cancel : Icons.filter_list,
                );
              },
            ),
          ),
        )
      ],
    );
  }

  onChanged(String text, MyStore model) => model.filter = text;

  onTap(MyStore model, BuildContext context) {
    model.isDeleteable
        ? model.isDeleteable = false
        : showDialog(
            context: context,
            builder: (context) => Center(
              child: FractionallySizedBox(
                widthFactor: .8,
                heightFactor: .5,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
          );
  }
}
