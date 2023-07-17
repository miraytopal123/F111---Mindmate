import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:reminder_app/services/reminder_action.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'homepage.dart';

class AddReminderPage extends StatefulWidget {
  @override
  _AddStatusPageState createState() => _AddStatusPageState();

}

class _AddStatusPageState extends State<AddReminderPage> {
  double _startHour = 0.0;
  double _endHour = 12.0;
  double _startMinute = 0.0;
  double _endMinute = 59.0;
  @override
  void initState(){
    super.initState();
    FirebaseStorage.instance.ref('/imagesfolder').listAll();
  }
  TextEditingController statusController = TextEditingController();
  ReminderActions _statusService = ReminderActions();

  final ImagePicker _pickerImage = ImagePicker();
  dynamic _pickImage;
  var profileImage;

  Widget imagePlace() {
    double height = MediaQuery.of(context).size.height;
    if (profileImage != null) {
      return CircleAvatar(
          backgroundImage: FileImage(File(profileImage.path)),
          radius: height * 0.08);
    } else {
      if (_pickImage != null) {
        return CircleAvatar(
          backgroundImage: NetworkImage('_pickImage'),
          radius: height * 0.08,
        );
      } else
        return CircleAvatar(
          backgroundImage: NetworkImage('https://www.pngkey.com/png/detail/207-2079267_circle-icons-polaroidcamera-camera-icon-png-circle.png'),
          radius: height * 0.08,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Hatırlatıcı Ekle"),
          backgroundColor: Colors.brown,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * .6,
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
                          controller: statusController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Bir şeyler yazın...",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: imagePlace(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () => _onImageButtonPressed(
                                  ImageSource.camera,
                                  context: context),
                              child: Icon(
                                Icons.camera_alt,
                                size: 30,
                                color: Colors.brown,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () => _onImageButtonPressed(
                                  ImageSource.gallery,
                                  context: context),
                              child: Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.brown,
                              ))
                        ],
                      ),

                      RangeSlider(
                        values: RangeValues(_startHour, _endHour),
                        min: 0.0,
                        max: 12.0,
                        divisions: 12,
                        onChanged: (RangeValues values) {
                          setState(() {
                            _startHour = values.start;
                            _endHour = values.end;
                          });
                        },
                        labels: RangeLabels(
                          "${_startHour.toStringAsFixed(0)} Saat",
                          "${_endHour.toStringAsFixed(0)} Saat",
                        ),
                        activeColor: Colors.teal,
                      ),

                      RangeSlider(

                        values: RangeValues(_startMinute, _endMinute),
                        min: 0.0,
                        max: 59.0,
                        divisions: 59,
                        onChanged: (RangeValues values) {
                          setState(() {
                          "${_startMinute = values.start} Dakika";
                          "${_endMinute = values.end} Dakika";
                          });
                        },
                        labels: RangeLabels(
                          _startMinute.toStringAsFixed(0),
                          _endMinute.toStringAsFixed(0),
                        ),
                        activeColor: Colors.teal,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 25),
              child: ElevatedButton(
                onPressed: () {
                  _statusService
                      .addStatus(statusController.text, profileImage ?? '')
                      .then((value) {
                    Fluttertoast.showToast(
                      msg: "Durum eklendi!",
                      timeInSecForIosWeb: 2,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.grey[600],
                      textColor: Colors.white,
                      fontSize: 14,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Ekle",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),

                ),

              ),
            ),

          ],
        ));
  }

  void _onImageButtonPressed(ImageSource source,
      {required BuildContext context}) async {
    try {
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        profileImage = pickedFile!;
        print("dosya: $profileImage");
        if (profileImage != null) {}
      });
    } catch (e) {
      setState(() {
        _pickImage = e;
        print("Image Error: " + _pickImage);
      });
    }
  }
}