import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;


  Future<String> uploadMedia(File file) async {//resim ekleme
    var uploadTask = _firebaseStorage
        .ref()
        .child(
        "${DateTime.now().millisecondsSinceEpoch}.${file.path.split('.').last}")
        .putFile(file);

    uploadTask.snapshotEvents.listen((event) {});

    var storageRef = await uploadTask;

    return await storageRef.ref.getDownloadURL();
  }
}