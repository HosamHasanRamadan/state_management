import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/BlocExample/MyBlocStateModel.dart';

import 'MyBloc.dart';
import 'MyBlocEvent.dart';
import 'ui/SearchAppBar.dart';
import 'ui/ListElement.dart';

class BlocExample extends StatefulWidget {
  BlocExample({Key key}) : super(key: key);

  _BlocExampleState createState() => _BlocExampleState();
}

class _BlocExampleState extends State<BlocExample> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MyBloc>(context).add(LoadData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar.build(context),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return GestureDetector(
      onLongPress: () => BlocProvider.of<MyBloc>(context).add(Editing(true)),
      child: BlocBuilder<MyBloc, MyBlocStateModel>(
        condition: (oldState, newState) {
          if (oldState is MyBlocStateModel && newState is MyBlocStateModel) {
            return oldState.photos != newState.photos;
          }
          return false;
        },
        builder: (context, state) => ListView(
          children: state.photos
              .map(
                (value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListElement(
                    key: Key(value.id.toString()),
                    photo: value,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<MyBloc>(context).close();
  }
}
