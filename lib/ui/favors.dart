import 'package:KarmaG8Flutter/backend/firebase_real_time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
class FavorsPage extends StatefulWidget {
  @override
  _FavorsPageState createState() => _FavorsPageState();
}
class _FavorsPageState extends State<FavorsPage> {
  CollectionReference favors = Firestore.instance.collection('favores');
  FirebaseProvider repo = new FirebaseProvider();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: favors.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return new ListView(
              children: snapshot.data.documents.map((
                  DocumentSnapshot document) {
                if (document.data['user'] != "camilo@gmail.com") {
                  if(document.data['terminado1']=="1"&&document.data['terminado2']=="1"){
                    repo.deleteProduct(document.data['id'],"orlando@gmail.com",document.data['name']);

                  }
                  if (document.data['state'] == "iniciado"){
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.arrow_drop_down_circle),
                            title: Text(document.data['name']),
                            subtitle: Text(
                              document.data['description'],
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ),

                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              FlatButton(
                                textColor: const Color(0xFFB41EAEC),
                                onPressed: () {
                                  // Perform some action
                                  repo.AceptProduct(document.data['id']);
                                },
                                child: const Text('Aceptar'),
                              ),

                            ],
                          ),

                        ],
                      ),
                    );

                  }else{
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.arrow_drop_down_circle),
                            title: Text(document.data['name']),
                            subtitle: Text(
                              document.data['description'],
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ),

                          Row(
                            children: [
                              FlatButton(
                                textColor: const Color(0xFFB41EAEC),
                                onPressed: () {
                                  // Perform some action
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatPage()),
                                  );
                                },
                                child: const Text('chat'),
                              ),
                              FlatButton(
                                textColor: const Color(0xFFB41EAEC),
                                onPressed: () {
                                  // Perform some action
                                  repo.endProduct("0",document.data['id']);
                                },
                                child: const Text('terminar'),
                              ),

                            ],
                          ),


                        ],
                      ),
                    );

                  }

                }
              }).toList(),
            );
          },
        ),
    );
  }
}

