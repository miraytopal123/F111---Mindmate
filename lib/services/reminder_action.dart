import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reminder_app/model/reminder.dart';
import 'package:reminder_app/services/storage.dart';

class ReminderActions {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Storage _storageService = Storage();
  String mediaUrl = "";


  Future<Reminder> addStatus(String reminder, PickedFile pickedFile) async {//reminder ekleme
    var ref = _firestore.collection("Reminder");

    mediaUrl = await _storageService.uploadMedia(File(pickedFile.path));

    var documentRef = await ref.add({'reminder': reminder, 'image': mediaUrl});

    return Reminder(id: documentRef.id, reminder: reminder, image: mediaUrl);
  }


  Stream<QuerySnapshot> getReminder() {  //reminder gösterme
    var ref = _firestore.collection("Reminder").snapshots();

    return ref;
  }


  Future<void> removeReminder(String docId) { // reminder silme
    var ref = _firestore.collection("Reminder").doc(docId).delete();

    return ref;
  }
}