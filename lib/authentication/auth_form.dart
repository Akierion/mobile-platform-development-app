import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

/* Source used to help setup this page --> https://github.com/akmadan/todo_firebase_flutter */

class _AuthFormState extends State<AuthForm> {
  // ------------------------
  final _formkey = GlobalKey<FormState>(); // Unique across entire app
  var userEmail = '';
  var userPassword = '';
  var userUsername = '';
  bool isLoginPage = false;
  // ------------------------

  //
  startAuthentication() {
    // Calls submitForm and authenticates the user
    final _validation = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_validation) {
      _formkey.currentState!.save();
      submitForm(userEmail, userPassword, userUsername);
    }
  }

  submitForm(String email, String password, String username) async {
    final authenticate = FirebaseAuth.instance;
    UserCredential authResult;
    try {
      if (isLoginPage) { // If loginpage is called:
        authResult =
        await authenticate.signInWithEmailAndPassword(email: email, password: password);
      }
      else {
        authResult = await authenticate.createUserWithEmailAndPassword(
            email: email, password: password);
        String? uID = authResult.user?.uid;
        await FirebaseFirestore.instance
            .collection('users') // Collection
            .doc(uID) // Document
            .set(({ // Set of keys in field, stores 'username' as the user's username and 'email' as the user's email
              'username': username,
              'email': email,
        }));
      }
    }
      on PlatformException catch (err) { // Error handling, required for try and except to work
        if (err.message != null) {
        }
      }
      catch (err) {
        print(err);
      }
    }

  // ------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 45.0),
            Text('Welcome!', style: TextStyle(color: Colors.black,
                fontFamily: 'Rubik',decoration: TextDecoration.none), textAlign: TextAlign.center),
            SizedBox(height: 50.0,),
            //const Image(image: AssetImage('assets/logo.png'), height: 200),
            Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isLoginPage) // Default to register screen
                        Card (
                          child:TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: ValueKey('username'),
                          validator: (value) {
                            if (value!.isEmpty) { // If user tries to enter nothing, it will return 'Invalid username'
                              return 'Invalid username';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userUsername = value!; // user data is saved to value which can be used to save it to userUsername, userEmail & userPassword etc
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  borderSide: new BorderSide()),
                              labelText: "Enter Username")),
                        ),
                      SizedBox(height: 10),
                      Card (
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: ValueKey('email'),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) { // If value is empty or does not contain an @ symbol, return 'Invalid email'
                              return 'Invalid email';
                            }
                            return null; // otherwise, return nothing
                          },
                          onSaved: (value) {
                            userEmail = value!;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  borderSide: new BorderSide()),
                              labelText: "Enter Email"),
                        ),
                      ),
                      SizedBox(height: 10),
                      Card(
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          key: ValueKey('password'),
                          validator: (value) {
                            if (value!.isEmpty) { // If nothing is in password box, return 'Invalid password'
                              return 'Invalid password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userPassword = value!;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  borderSide: new BorderSide()),
                              labelText: "Enter Password")
                        ),
                      ),
                      SizedBox(height: 10),

                      ElevatedButton(
                              child: isLoginPage
                                  ? Text('Login') : Text('Sign up'),
                              onPressed: () {
                                startAuthentication(); // Both 'Login' and 'SignUp' buttons are authenticated using startAuthentication
                              }),
                      SizedBox(height: 10),
                      Card(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                isLoginPage = !isLoginPage; // If one or the other of 'not a member' and 'already a member' is pressed, switch the pages
                              });
                            },
                            child: isLoginPage
                                ? Text('Not a member?') // Pressing not a member takes you to register page
                                : Text('Already a Member?') // Pressing already a member takes you to login page
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
