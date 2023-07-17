import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:reminder_app/pages/add.dart';
import 'package:reminder_app/pages/login.dart';
import 'package:reminder_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var profileImage;

  AuthService _authService = AuthService();

  bool isOn = false;
  int alarmId = 1;

  @override
  void initState() {
    super.initState();
    AndroidAlarmManager.initialize();
  }

  @override
  void dispose() {
    AndroidAlarmManager.cancel(alarmId);
    super.dispose();
  }

  void fireAlarm() {
    print('Alarm Fired at ${DateTime.now()}');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        backgroundColor: Colors.brown,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * .4,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.brown, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: "Su içme hatırlatıcısı",
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/images/water-bottle.png',
                          width: 150,
                          height: 150,
                        ),
                      ],
                    ),
                    Transform.scale(
                      scale: 2,
                      child: Switch(
                        value: isOn,
                        onChanged: (value) {
                          setState(() {
                            isOn = value;
                          });
                          if (isOn == true) {
                            AndroidAlarmManager.periodic(
                              Duration(seconds: 60),
                              alarmId,
                              fireAlarm,
                            );
                          } else {
                            AndroidAlarmManager.cancel(alarmId);
                            print('Alarm Timer Canceled');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              leading: Icon(Icons.remove_circle),
            ),
          ],
        ),
      ),
    );
  }
}
