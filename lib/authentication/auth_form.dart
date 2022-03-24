import 'package:flutter/material.dart';

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
    final validity = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (validity) {
      _formkey.currentState.save();
      submitForm();
    }
  }

  submitForm() async {
    final auth = FirebaseAuth.instance;
  }
  // ------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isLoginPage)
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')){
                      return 'Incorrect email';
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
                      labelText: 'Enter Email'),
                  ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty){
                      return 'Incorrect password';
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
                      labelText: 'Enter Password'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  key: ValueKey('username'),
                  validator: (value) {
                    if (value!.isEmpty){
                      return 'Incorrect username';
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
                      labelText: 'Enter username'),
                ),
              SizedBox(height: 10.0),
              Container(
                width: double.infinity,
                  height: 70.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.all(5.0),
                child: RaisedButton(color: Colors.grey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: isLoginPage? Text('Login', style: TextStyle(fontFamily: 'Rubik', fontSize: 16.0),): Text('Signup', style: TextStyle(fontFamily: 'Rubik', fontSize: 16.0)),
                    onPressed: (){})),
              SizedBox(height: 10.0),
              Container(
                child: TextButton(onPressed: (){
                  setState(() {
                    isLoginPage = !isLoginPage;
                  });
                }, child: isLoginPage? Text('Not a member?'): Text('Already a member?'),),
              )
            ],
            ),
          ),
        )
      ],)
    );
  }
}
