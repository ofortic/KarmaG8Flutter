import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Nunito"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: loginPage(),
        ),
      ),
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  int _pageState = 0;

  var _backgroundColor = Colors.white;

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeigth = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;

  double windowWidth = 0;
  double windowHeigth = 0;

  @override
  Widget build(BuildContext context) {
    windowHeigth = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;

    _loginHeigth = windowHeigth - 270;

    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingTop = 100;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _loginYOffset = windowHeigth;
        _loginXOffset = 0;
        _registerYOffset = windowHeigth;
        break;
      case 1:
        _backgroundColor = Color(0xFFBB3F5F6);
        _headingTop = 90;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _loginYOffset = 270;
        _loginXOffset = 0;
        _registerYOffset = windowHeigth;
        break;
      case 2:
        _backgroundColor = Color(0xFFBB3F5F6);
        _headingTop = 80;
        _loginWidth = windowWidth - 40;
        _loginOpacity = 0.7;
        _loginYOffset = 250;
        _loginXOffset = 20;
        _registerYOffset = 270;
        break;
    }

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
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 2;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _loginWidth,
            height: _loginHeigth,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform:
                Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(_loginOpacity),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
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
                    InputWithIcon(),
                    SizedBox(
                      height: 20,
                    ),
                    InputWithIcon()
                  ],
                ),
                Column(
                  children: [
                    PrimaryButton(
                      btnText: "Login",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OutLineBtn(
                      btnText: "Create New Account",
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _pageState = 1;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Create a New Account",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    PrimaryButton(
                      btnText: "Create Account",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    OutLineBtn(
                      btnText: "Back To Login",
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class InputWithIcon extends StatefulWidget {
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
                Icons.email,
                size: 20,
                color: Colors.grey,
              )),
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: "Enter Email..."),
          ))
        ],
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final String btnText;
  PrimaryButton({this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFB41EAEC), borderRadius: BorderRadius.circular(50)),
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
