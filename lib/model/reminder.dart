import 'package:cloud_firestore/cloud_firestore.dart';

class Reminder {
  String id;
  String reminder;
  String image;

  Reminder({required this.id, required this.reminder, required this.image});

  factory Reminder.fromSnapshot(DocumentSnapshot snapshot) {
    return Reminder(
      id: snapshot.id,
      reminder: snapshot["reminder"],
      image: snapshot["image"],
    );
  }
}