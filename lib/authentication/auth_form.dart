import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // ------------------------
  final _formkey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _username = '';
  bool isLoginPage = false;
  // ------------------------

  startAuthentication() {
    final validity = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (validity) {
      _formkey.currentState!.save();
      submitForm(_email, _password, _username);
    }
  }

  submitForm(String email, String password, String username) async {
    final auth = FirebaseAuth.instance;
    UserCredential authResult;
    try {
      if (isLoginPage) {
        authResult =
        await auth.signInWithEmailAndPassword(email: email, password: password);
      }
      else {
        authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String? uID = authResult.user?.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uID)
            .set(({
              'username': username,
              'email': email,
        }));
      }
    }
      on PlatformException catch (err) {
        String? message = 'An error occured';
        if (err.message != null) {
          message = err.message;
        }
      } catch (err) {
        print(err);
      }
    }

  // ------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isLoginPage)
                        Card (
                          child:TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: ValueKey('username'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Invalid username';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value!;
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
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
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
                            if (value!.isEmpty) {
                              return 'Invalid password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _password = value!;
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
                                  ? Text('Login') : Text('SignUp'),
                              onPressed: () {
                                startAuthentication();
                              }),
                      SizedBox(height: 10),
                      Card(
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                isLoginPage = !isLoginPage;
                              });
                            },
                            child: isLoginPage
                                ? Text('Not a member?')
                                : Text('Already a Member?')
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
