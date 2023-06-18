import 'package:flutter/material.dart';
import 'package:reminder_app/pages/login.dart';

class SignupPage extends StatelessWidget {
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
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'Merhaba, haydi kayıt ol!',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                contentPadding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
              ),
            ),

            const SizedBox(height: 10.0),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Şifre',
                contentPadding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
              ),
            ),
            const SizedBox(height: 10.0),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Tekrar şifre',
                contentPadding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
              ),
              obscureText: true,
            ),

            SizedBox(height: 16.0),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
                primary: Colors.brown,
              ),
              child: Text('Kayıt ol',
                style: TextStyle(fontSize: 18.0),
              ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),

            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.deepOrangeAccent,
              ),
              child: Text('Hesabınız var mı? Giriş yapınız!'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),

            SizedBox(height: 16.0),
            Image.asset(
              'lib/images/google_logo.png',
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
      ),
    );
  }
}
