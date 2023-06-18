import 'package:flutter/material.dart';
import 'package:reminder_app/pages/login.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/images/mindmate-logo.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
                  primary: Colors.brown,
                ),
                child: Text('Haydi başlayalım!'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/calendar.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'lib/images/think.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(width: 10),
                  Image.asset(
                    'lib/images/bell.png',
                    width: 50,
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
