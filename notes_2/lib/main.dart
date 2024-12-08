import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter/material.dart';
import 'package:notes_2/homepage.dart';
import 'package:notes_2/login.dart';
import 'package:notes_2/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            if (user == null) {
              return const Login(); // Redirect to Login
            } else {
              return const HomePage(); // Redirect to HomePage if signed in
            }
          }
          return const Center(
              child: CircularProgressIndicator()); // Loading indicator
        },
      ),
      routes: {
        "SignUp": (context) => Signup(),
        "homepage": (context) => const HomePage(),
        "login": (context) => const Login() // Ensure correct syntax
        // No need to include login route here, as it is handled above
      },
    );
  }
}
