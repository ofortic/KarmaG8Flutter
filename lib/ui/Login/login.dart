import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:KarmaG8Flutter/backend/firebase_auth.dart';
import 'package:KarmaG8Flutter/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home.dart';
import 'Login.dart';
import 'login_button.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  int _pageState = 0;

  var _backgroundColor = Colors.white;

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeigth = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;
  double _registerHeigth = 0;

  double windowWidth = 0;
  double windowHeigth = 0;

  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    windowHeigth = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeigth = windowHeigth - 270;
    _registerHeigth = windowHeigth - 270;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingTop = 100;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _loginYOffset = windowHeigth;
        _loginHeigth = _keyboardVisible ? windowHeigth : windowHeigth - 270;
        _loginXOffset = 0;
        _registerYOffset = windowHeigth;
        break;
      case 1:
        _backgroundColor = Color(0xFFBB3F5F6);
        _headingTop = 90;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _loginYOffset = _keyboardVisible ? 40 : 270;
        _loginHeigth = _keyboardVisible ? windowHeigth : windowHeigth - 270;
        _loginXOffset = 0;
        _registerYOffset = windowHeigth;
        break;
      case 2:
        _backgroundColor = Color(0xFFBB3F5F6);
        _headingTop = 80;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _loginYOffset = _keyboardVisible ? 30 : 240;
        _loginHeigth = _keyboardVisible ? windowHeigth : windowHeigth - 240;
        _loginXOffset = 20;
        _registerYOffset = _keyboardVisible ? 55 : 270;
        _registerHeigth = _keyboardVisible ? windowHeigth : windowHeigth - 270;
        break;
    }

    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return Stack(
      children: [
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _pageState = 0;
                  });
                },
                child: Container(
                  child: Column(
                    children: [
                      AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(milliseconds: 1000),
                          margin: EdgeInsets.only(top: _headingTop),
                          child: Text(
                            "KarmaG8",
                            style: TextStyle(fontSize: 28),
                          )),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          "Mercado de favores para la Universidad del Norte",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Center(child: Image.asset("assets/images/karma.png")),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_pageState != 0) {
                        _pageState = 0;
                      } else {
                        _pageState = 1;
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFFB41EAEC),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 16),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: _loginWidth,
          height: _loginHeigth,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Login To Continue",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  InputWithIcon(
                    controller: emailController,
                    icon: Icons.email,
                    hint: "Enter Email...",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputWithIcon(
                    controller: passController,
                    icon: Icons.vpn_key,
                    hint: "Enter Password...",
                    onSubmit: (_) {
                      _login(
                          context, emailController.text, passController.text);
                    },
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: PrimaryButton(
                      btnText: "Login",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 2;
                      });
                    },
                    child: OutLineBtn(
                      btnText: "Create New Account",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: _registerHeigth,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Create a New Account",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  InputWithIcon(
                    controller: emailController,
                    icon: Icons.email,
                    hint: "Enter Email...",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputWithIcon(
                    controller: passController,
                    icon: Icons.vpn_key,
                    hint: "Enter Password...",
                    onSubmit: (_) {
                      _signUp(context, emailController.text,
                          passController.text, emailController.text);
                      // }
                      setState(() {
                        _pageState = 1;
                      });
                    },
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // final form = _formKey.currentState;
                      // form.save();
                      // if (_formKey.currentState.validate()) {
                      print(
                          "email: $emailController password: $passController");
                      _signUp(context, emailController.text,
                          passController.text, emailController.text);
                      // }
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: PrimaryButton(
                      btnText: "Create Account",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: OutLineBtn(
                      btnText: "Back To Login",
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  _login(BuildContext context, String email, String password) {
    signInWithFirebase(email, password).then((user) {
      print("Usuario: $user");
      _buildDialog(context, "Login", "Login OK ");
      //model.setLogged();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }).catchError((error) {
      _buildDialog(context, "Login", error.toString());
    });
  }

  _signUp(BuildContext context, String email, String password, String name) {
    signUpWithFirebase(email, password, name).then((user) {
      print(user);
      _buildDialog(context, "Sign Up", "Sign Up OK").then((value) {
        _formKey.currentState.reset();
        Navigator.of(context).pop();
      });
    }).catchError((error) {
      _buildDialog(context, "Sign Up", error.toString());
    });
  }

  Future<void> _buildDialog(BuildContext context, _title, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(_title),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  final TextEditingController controller;
  final Function onSubmit;
  InputWithIcon({this.icon, this.hint, this.controller, this.onSubmit});
  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Colors.grey,
              )),
          Expanded(
              child: TextField(
            onSubmitted: widget.onSubmit,
            controller: widget.controller,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: widget.hint),
          ))
        ],
      ),
    );
  }
}

class OutLineBtn extends StatefulWidget {
  final String btnText;
  OutLineBtn({this.btnText});

  @override
  _OutLineBtnState createState() => _OutLineBtnState();
}

class _OutLineBtnState extends State<OutLineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
