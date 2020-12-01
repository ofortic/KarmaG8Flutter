import 'dart:core';
import 'package:KarmaG8Flutter/models/message.dart';
import 'package:KarmaG8Flutter/backend/firebase_real_time.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  List<Message> messages = List();
  FirebaseProvider realTime = new FirebaseProvider();
  final msg = TextEditingController();
  AnimationController _controller;
  Animation _animation;
  FocusNode _focusNode = FocusNode();

  void dispose() {
    msg.dispose();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _sendMsg(String msg) {
    realTime.sendChatMsg(msg);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 550.0, end: 275.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });

    databaseReference
        .child("fluttermessages")
        .onChildChanged
        .listen(_onEntryChanged);
    databaseReference
        .child("fluttermessages")
        .onChildAdded
        .listen(_onEntryAdded);
  }

  _onEntryAdded(Event event) {
    print("Somethig was added");
    setState(() {
      messages.add(Message.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    print("Somethig changed");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Chat'),
          backgroundColor: Color(0xFFB41EAEC),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: _animation.value,
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, posicion) {
                  var element = messages[posicion];
                  return Container(
                    height: 50,
                    child: Center(child: Text('Entry ${element.text}')),
                  );
                },
              ),
            ),
            new InkWell(
                // to dismiss the keyboard when the user tabs out of the TextField
                splashColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Container(
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
                            controller: msg,
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
                            decoration: InputDecoration.collapsed(
                              hintText: 'Type a message',
                              hintStyle: TextStyle(color: Colors.blueGrey),
                            ),
                            focusNode: _focusNode,
                          ),
                        ),
                      ),

                      // Send Message Button
                      FloatingActionButton(
                        backgroundColor: const Color(0xff03dac6),
                        foregroundColor: Colors.black,
                        mini: true,
                        onPressed: () {
                          _sendMsg(msg.text);
                          msg.clear();
                        },
                        child: Icon(Icons.send),
                      )
                    ],
                  ),
                  width: double.infinity,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      border: new Border(
                          top: new BorderSide(
                              color: Colors.blueGrey, width: 0.5)),
                      color: Colors.white),
                ))
          ],
        ));
  }
}
