import 'package:reminder_app/pages/add.dart';
import 'package:reminder_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindmate'),
        backgroundColor: Colors.brown,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddReminderPage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.brown, // Kahverengi renk
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),

              accountName: Text("Begüm Ekmekçi"),
              accountEmail: Text("bbegum.ekmekci@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("lib/images/woman.png"),
                backgroundColor: Colors.brown,
              ),
            ),
            ListTile(
              title: Text('Anasayfa'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profilim'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.person),
            ),
            Divider(),
            ListTile(
              title: Text('Çıkış yap'),
              onTap: () {
                _authService.signOut();
                Navigator.pop(context);
              },
              leading: Icon(Icons.remove_circle),
            ),
          ],
        ),
      ),
    );
  }
}
