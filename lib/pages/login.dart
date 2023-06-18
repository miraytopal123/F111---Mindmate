import 'package:flutter/material.dart';
import 'package:reminder_app/pages/signup.dart';
import 'homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Image.asset(
                'lib/images/mindmate-logo.png',
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 10),
              Text(
                'Merhaba, tekrar hoşgeldin!',
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
                obscureText: true,
              ),


              const SizedBox(height: 20.0),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
                  primary: Colors.brown,
                ),
                child: Text(
                  'Giriş yap',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                  // Giriş yaptıktan sonraki işlemler
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'veya Google ile devam et',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

                Image.asset(
                  'lib/images/google_logo.png',
                  width: 30,
                  height: 30,
                ),

              const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.deepOrangeAccent,
              ),
              child: Text('Üye değil misin? Yeni hesap oluştur!'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    ),
    );
  }
}
