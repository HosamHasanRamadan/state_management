import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/ListBloc/ListBloc.dart';
import 'blocs/ListBloc/ListBlocEvent.dart';
import 'blocs/ListBloc/ListBlocState.dart';
import 'ui/ListElement.dart';
import 'ui/SearchAppBar.dart';

class BlocWithSealedUnionExample extends StatefulWidget {
  BlocWithSealedUnionExample({Key key}) : super(key: key);

  _BlocWithSealedUnionExampleState createState() =>
      _BlocWithSealedUnionExampleState();
}

class _BlocWithSealedUnionExampleState
    extends State<BlocWithSealedUnionExample> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListBloc>(context).add(ListEvent.intializeList());
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
      // onLongPress: () => BlocProvider.of<ListBloc>(context).add(ListEvent.)),
      child: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) => state.join<Widget>(
          (initial) => Center(
            child: CircularProgressIndicator(),
          ),
          (loading) => Center(
            child: CircularProgressIndicator(),
          ),
          (loaded) => ListView(
            children: loaded.photos
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
          (failed) => Text('error'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<ListBloc>(context).close();
  }
}
