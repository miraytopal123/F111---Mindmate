import 'package:flutter/material.dart';
import 'package:reminder_app/pages/login.dart';
import 'package:reminder_app/services/auth.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // Ekleme yapılacak widget
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/mindmate-logo.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 10),
                Text(
                  'Merhaba, haydi kayıt ol!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    labelText: 'Kullanıcı Adı',
                    contentPadding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                    labelText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.grey,
                    ),
                    labelText: 'Şifre',
                    contentPadding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordAgainController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.grey,
                    ),
                    labelText: 'Tekrar şifre',
                    contentPadding: EdgeInsets.fromLTRB(12.0, 16.0, 12.0, 16.0),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
                    primary: Colors.brown,
                  ),
                  child: Text(
                    'Kayıt ol',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () {
                    _authService
                        .createPerson(
                      _nameController.text,
                      _emailController.text,
                      _passwordController.text,
                    )
                        .then((value) {
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage()));
                    });
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
                SizedBox(height: 3.0),
                Image.asset(
                  'lib/images/google_logo.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
