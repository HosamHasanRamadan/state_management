import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../MyBloc.dart';
import '../MyBlocEvent.dart';
import '../MyBlocStateModel.dart';

class SearchAppBar {
  static AppBar build(BuildContext context) {
    final bloc = BlocProvider.of<MyBloc>(context);
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 15),
        child: Divider(thickness: 10, color: Colors.black, height: 0),
      ),
      title: Container(
        color: Colors.white,
        child: TextField(
          onChanged: (text) => bloc.add(Filter(text)),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () {
              if (bloc.state.isDeleteable) bloc.add(Editing(false));
            },
            child: BlocBuilder<MyBloc, MyBlocStateModel>(
              condition: (oldS, newS) {
                return newS is MyBlocStateModel;
              },
              builder: (context, state) {
                return Icon(
                  state.isDeleteable ? Icons.cancel : Icons.filter_list,
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
