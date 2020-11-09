import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavorsPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: new ListView(
                children: [
                  _buildItem('Sacar Fotocopias'),
                  _buildItem('Domicilio'),
                  _buildItem('Domicilio'),
                  _buildItem('Prestar Libro')
                ]
            ),
    );
  }
}

Widget _buildItem(String textTitle) {
  return new ListTile(
    title: new Text(textTitle),
    subtitle: new Text('Subtitulo ejemplo'),
    leading: new Icon(Icons.map),
  );
}