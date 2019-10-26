import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/BlocWithSealedUnionExample/blocs/ListBloc/ListBloc.dart';
import 'package:state_managment/BlocWithSealedUnionExample/blocs/ListBloc/ListBlocEvent.dart';
import 'package:state_managment/BlocWithSealedUnionExample/blocs/ListBloc/ListBlocState.dart';

class SearchAppBar {
  static AppBar build(BuildContext context) {
    final bloc = BlocProvider.of<ListBloc>(context);
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 15),
        child: Divider(thickness: 10, color: Colors.black, height: 0),
      ),
      title: Container(
        color: Colors.white,
        child: TextField(
          onChanged: (text) => bloc.add(ListEvent.filter(text)),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            //   onTap: () {
            //     if (bloc.state.isDeleteable) bloc.add(Editing(false));
            //   },
            child: BlocBuilder<ListBloc, ListState>(
              builder: (context, state) {
                return Icon(
                  // state.isDeleteable ? Icons.cancel :
                  Icons.filter_list,
                );
              },
            ),
          ),
        )
      ],
    );
  }

  // onTap(MyModel model, BuildContext context) {
  //   model.isDeleteable
  //       ? model.isDeleteable = false
  //       : showDialog(
  //           context: context,
  //           builder: (context) => Center(
  //             child: FractionallySizedBox(
  //               widthFactor: .8,
  //               heightFactor: .5,
  //               child: Container(
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ),
  //         );
  // }
}
