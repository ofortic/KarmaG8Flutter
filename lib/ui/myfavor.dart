import 'package:KarmaG8Flutter/ui/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFavorPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body:Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_drop_down_circle),
              title: const Text('Sacar Fotocopias'),
              subtitle: Text(
                'LLevar al bambu',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sacar 4 copias de cada pagina, para antes de las 12:30AM',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  textColor: Color(0xFFB41EAEC),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage())
                    );
                  },
                  child: const Text('Chat'),
                ),
                FlatButton(
                  textColor: Color(0xFFB41EAEC),
                  onPressed: () {
                    // Perform some action
                  },
                  child: const Text('Terminar'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton:   FloatingActionButton(

        onPressed: () {
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
                                  hintText: 'Favors name',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),

                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Favors Description',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                child: Text("Submit"),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });

      // Respond to button press
      },

        child: Icon(Icons.add),
        backgroundColor: Color(0xFFB41EAEC),
      ),

    );
  }
}