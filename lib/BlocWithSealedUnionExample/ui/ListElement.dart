import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/BlocExample/MyBlocEvent.dart';
import 'package:state_managment/BlocExample/MyBlocStateModel.dart';
import 'package:state_managment/BlocWithSealedUnionExample/blocs/ListBloc/ListBloc.dart';
import 'package:state_managment/BlocWithSealedUnionExample/blocs/ListBloc/ListBlocState.dart';
import 'package:state_managment/Models/Photo.dart';

class ListElement extends StatelessWidget {
  final Photo photo;
  ListElement({
    Key key,
    this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ClipOval(child: Image.network(photo.url)),
                  SizedBox(width: 10),
                  Flexible(flex: 1, child: Text(photo.title)),
                  BlocBuilder<ListBloc, ListState>(
                    builder: (context, state) => Visibility(
                      visible: true, // state.isDeleteable,
                      child: GestureDetector(
                        // onTap: () => BlocProvider.of<MyBloc>(context)
                        //     .add(DeletePhoto(photo)),
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
