import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyFavorPage extends StatelessWidget {
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
                    // Perform some action
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
      // Respond to button press
      },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFB41EAEC),
      ),
    );
  }
}