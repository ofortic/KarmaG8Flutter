import 'package:KarmaG8Flutter/backend/firebase_real_time.dart';
import 'package:KarmaG8Flutter/ui/chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyFavorPage extends StatefulWidget {
  @override
  _MyFavorPageState createState() => _MyFavorPageState();
}

class _MyFavorPageState extends State<MyFavorPage> {
  FirebaseProvider repo = new FirebaseProvider();
  final name = TextEditingController();
  final description = TextEditingController();
  CollectionReference favor = Firestore.instance.collection('favores');
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: favor.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Text(document.data['Name']),
                subtitle: new Text(document.data['Description']),
              );
            }).toList(),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(

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
                                controller: name,
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
                                controller: description,
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
                                  textColor: Colors.white,
                                  color: Color(0xFFB41EAEC),
                                  onPressed: () {
                                    repo.addProduct(
                                        name.text, description.text);
                                    name.clear();
                                    description.clear();
                                    Navigator.of(context).pop();
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

          // Respond to button press
        },

        child: Icon(Icons.add),
        backgroundColor: Color(0xFFB41EAEC),
      ),

    );
  }
}

