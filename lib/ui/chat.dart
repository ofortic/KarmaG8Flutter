import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        backgroundColor: Color(0xFFB41EAEC),
      ),
      body:Column(
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Orlando Fortich'),
                  subtitle: Text(
                    'hola, en un momento le llevare sus copias',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height:470,
            child:Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Camilo Pacheco'),
                    subtitle: Text(
                      'Listo, no hay problemas',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
            ),

          ),

      Container(
        child: Row(
          children: <Widget>[
            Material(
              child: new Container(
                margin: new EdgeInsets.symmetric(horizontal: 1.0),
                child: new IconButton(
                  icon: new Icon(Icons.face),
                  color: Color(0xFFB41EAEC),
                ),
              ),
              color: Colors.white,
            ),

            // Text input
            Flexible(
              child: Container(
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Type a message',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),
            ),

            // Send Message Button
            Material(
              child: new Container(
                margin: new EdgeInsets.symmetric(horizontal: 8.0),
                child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => {},
                  color: Color(0xFFB41EAEC),
                ),
              ),
              color: Colors.white,
            ),
          ],
        ),
        width: double.infinity,
        height: 50.0,
        decoration: new BoxDecoration(
            border: new Border(
                top: new BorderSide(color: Colors.blueGrey, width: 0.5)),
            color: Colors.white),
      )
        ],

      )


    );
  }
}