import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_prototype/authentication/auth_form.dart';
import 'package:first_prototype/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:first_prototype/pages/themes.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Connects app to Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes Necessities', // Title of App
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), // A stream is needed between the app and Firebase to update the snapshot (the data stored within Firebase)
      builder: (context, userSnapshot)
      {
        if (userSnapshot.hasData) {
          // if user is logged, in return content
          return MainPage();
        }
        else{
          // otherwise, return the authentication form i.e. when the user signs out using the button in settings
          return AuthForm();
        }
      }),
      theme: lightTheme, // Light theme and dark theme are both defined in themes.dart
    );
  }
}