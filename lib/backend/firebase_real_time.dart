import 'package:KarmaG8Flutter/models/message.dart';
import 'package:KarmaG8Flutter/providers/authProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final FirebaseAuth _auth = FirebaseAuth.instance;
final db = Firestore.instance;
AuthProvider auth= new AuthProvider();
get _getFirebaseChatReference => databaseReference.child("fluttermessages");

class FirebaseProvider {
  List<Message> messages = List();

  Future<String> sendChatMsg(String text) async {
    try {
      // var firebaseUser = await _auth.currentUser();
      // final FirebaseUser user = firebaseUser;
      // final uid = user.uid;
      databaseReference
          .child("fluttermessages")
          .push()
          .set({'text': text, 'user': auth.getUser()});
    } catch (error) {
      print('ERRORS');
      print(error.message.toString());
      print(error.code.toString());
      return Future.error(error.message.toString());
    }
  }

  Future<void> addProduct(String name, String description, String state,
      String terminado1, String terminado2,String user, String id) async {
    await db.collection('favores').document(id).setData({
      'name': name,
      'description': description,
      'user': user,
      'state': state,
      'terminado1': terminado1,
      'terminado2': terminado2,
      'id': id
    });
  }

  Future<void> AceptProduct(String id) async {
    await db.collection('favores').document(id).updateData({
      'state': "Aceptado",
    });
  }

  Future<void> endProduct(String user, String id) async {
    if (user == "1") {
      await db.collection('favores').document(id).updateData({
        'terminado1': "1",
      });
    } else {
      await db.collection('favores').document(id).updateData({
        'terminado2': "1",
      });
    }
  }
  Future<void> deleteProduct(String id,String user, String name) async {
    await db.collection('favores Realizados').document(id).setData({
      'name': name,
      'user': user,
    });
      await db.collection('favores').document(id).delete();
  }
  CollectionReference cargarProductos(String uid) {
    return db.collection('favores');
  }
}
