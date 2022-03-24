import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_prototype/authentication/auth_form.dart';
import 'package:first_prototype/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:first_prototype/pages/themes.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RECIPES NECESSITIES', // Title of App
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, usersnapshot)
      {
        if (usersnapshot.hasData) {
          return MainPage();
        }
        else{
          return AuthForm();
        }
      }),


      theme: lightTheme,
      //new ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
    );
  }
}