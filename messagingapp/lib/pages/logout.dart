import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Call the logout method from AuthService
            await _auth.signOut();
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
