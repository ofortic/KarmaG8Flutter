import 'package:KarmaG8Flutter/ui/favors.dart';
import 'package:KarmaG8Flutter/ui/myfavor.dart';
import 'package:KarmaG8Flutter/ui/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:KarmaG8Flutter/backend/firebase_auth.dart';

class Home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [ProfilePage(), FavorsPage(), MyFavorPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Karma G8'),
          backgroundColor: Color(0xFFB41EAEC),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: Color(0xFFB41EAEC),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Profile'),
              icon: Icon(Icons.account_circle),
            ),
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('MyFavor'),
              icon: Icon(Icons.library_books),
            ),
          ],
        ));
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
