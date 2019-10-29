import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MyModel.dart';

class SearchAppBar {
  AppBar build(BuildContext context) {
    final model = Provider.of<MyModel>(context);
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
            child: Consumer<MyModel>(
              builder: (context, model, _) {
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

  onChanged(String text, MyModel model) => model.filter = text;

  onTap(MyModel model, BuildContext context) {
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
