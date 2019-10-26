import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:state_managment/BlocWithSealedUnionExample/blocs/ListBloc/ListBloc.dart';
import 'package:state_managment/InhertedModelExample/MyInheritedModel.dart';
import 'package:state_managment/Models/Photo.dart';
import 'package:state_managment/ProviderExample/ProviderExample.dart';
import 'package:state_managment/ScopedModelExample/ui/MyModel.dart'
    as scoopedModel;

import 'BlocWithSealedUnionExample/BlocWithSealedUnionExample.dart';
import 'InhertedModelExample/InheritedModelExample.dart';
import 'ProviderExample/ui/MyModel.dart' as providerModel;
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
      home: HomeProvider(),
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

class HomeBlocWithSealedUnions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (_) => ListBloc(),
      child: BlocWithSealedUnionExample(),
    );
  }
}

class HomeScopedModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<scoopedModel.MyModel>(
      model: scoopedModel.MyModel(),
      child: ScopedModelExample(),
    );
  }
}

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<providerModel.MyModel>.value(
      value: providerModel.MyModel(),
      child: ProviderExample(),
    );
  }
}
