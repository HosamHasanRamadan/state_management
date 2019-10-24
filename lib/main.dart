import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:state_managment/InhertedModelExample/MyInheritedModel.dart';
import 'package:state_managment/Models/Photo.dart';
import 'package:state_managment/ScopedModelExample/ui/MyModel.dart';

import 'InhertedModelExample/InheritedModelExample.dart';
import 'ScopedModelExample/ScopedModelExample.dart';
import 'StatefullWidgetExample/StatefullWidgetExample.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScopedModel(),
    );
  }
}

class HomeStatefullWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatefullWidgetExample();
  }
}

class HomeInheritedModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyInheritedModel(
      model: ModelInherited(
        "",
        false,
        <Photo>[],
      ),
      child: InheritedModelExample(),
    );
  }
}

class HomeScopedModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MyModel(),
      child: ScopedModelExample(),
    );
  }
}
