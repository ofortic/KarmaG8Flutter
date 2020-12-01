import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavorsPage extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: new ListView(
                children: [
                  _buildItem('Sacar Fotocopias', context),
                  _buildItem('Domicilio', context),
                  _buildItem('Domicilio', context),
                  _buildItem('Prestar Libro', context)
                ]
            ),
    );
  }
}

Widget _buildItem(String textTitle,BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  return new ListTile(
    title: new Text(textTitle),
    subtitle: new Text('Subtitulo ejemplo'),
    leading: new Icon(Icons.map),
    onTap: (){

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    right: -40.0,
                    top: -40.0,
                    child: InkResponse(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.close),
                        backgroundColor: Color(0xFFB41EAEC),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Creado por: Orlando Fortich',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),

                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Estado: sin aceptar',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Color(0xFFB41EAEC),
                              onPressed: () {
                                // Respond to button press
                              },
                              child: Text('Aceptar'),
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });

    },
  );
}