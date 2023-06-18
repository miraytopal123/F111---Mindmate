import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminder.dart';
import 'package:reminder_app/pages/add.dart';

class HomePage extends StatelessWidget {
  final List<Reminder> reminders = [
    Reminder(
      title: 'Su İçme Hatırlatıcısı',
      description: 'Günde en az 8 bardak su için.',
      icon: Icons.opacity,
    ),
    Reminder(
      title: 'İlaç Hatırlatıcısı',
      description: 'Doktorunun verdiği ilacı düzenli olarak kullan.',
      icon: Icons.medication,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Row(
          children: [
          SizedBox(width: 8),
            Text(
                'Mindmate',
                style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            )

          ]
        ),
      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(reminders[index].icon),
            title: Text(reminders[index].title),
            subtitle: Text(reminders[index].description),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddReminderPage(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.brown,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}



class AddReminderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text('Reminder ekle'),
      ),
    );
  }
}
