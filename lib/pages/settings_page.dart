import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// https://www.youtube.com/watch?v=FnXg0NK6hb8 - Used this to help with settings page setup

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = false;


  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings',textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontFamily: 'Rubik')),centerTitle: true,
            backgroundColor: Colors.white, foregroundColor: Colors.black),
        body: Container(
         padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Padding(padding: EdgeInsets.all(10.0)),
              SizedBox(height: 40.0),
              Row(
              children: [
                Icon(Icons.account_circle_rounded),
                SizedBox(width: 10.0),
                Text('Account', style: TextStyle(fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik'),)
              ]
          ),
          Divider(height: 20.0, thickness: 1.0,),
          SizedBox(height: 10.0),
          // -------- Various options available on settings page
          buildAccountOption(context, 'Change Password', 'Change Password Here'),
          buildAccountOption(context, 'Language', 'Languages Here'),
          buildAccountOption(context, 'Privacy and Security', 'Privacy and Security Here'),
          buildAccountOption(context, 'Terms and Conditions', 'Terms and Conditions Here'),
          SizedBox(height: 40.0),
          Row(
            children: [ // Preference Settings
              Icon(Icons.volume_up_outlined), //
              SizedBox(width: 10.0),
              Text('Preferences', style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik',
              )),
            ],
          ),
          // ---------- Dark theme button
          Divider(height: 20.0, thickness: 1.0),
          SizedBox(height: 10.0),
          buildNotificationOption('Dark Theme', valNotify1, onChangeFunction1),
          SizedBox(height: 50.0),
          Center ( // Sign out button
            child: OutlinedButton (
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )
              ),
              onPressed: (){
                _signOut(); // Calls sign out function
              },
              child: Text('SIGN OUT', style: TextStyle(
                fontSize: 20, letterSpacing: 2.2, color: Colors.black, fontFamily: 'Rubik'),
              ),
              ),
          ),
          ],
        )
              )
    );
  }

  // ------------- This is for building the setting options (each in their own row)
  Padding buildNotificationOption(String title, bool value, Function OnChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle( // Builds the preferences menu for each preference defined in the buildNotificationOption function on lines 41-43
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rubik',
          )),
          // Dark mode button functionality
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.green,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                // Darkmode feature would be implemented here
                OnChangeMethod(newValue);
                },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title, String content,) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog( // Alert dialog pops up a small box when you click each setting option
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(content),
              ],
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
                },
                  child: Text('Close'))
            ],
          );
        });
      },
      child: Padding (
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Rubik',)),
            Icon(Icons.arrow_forward, color: Colors.grey[600]),
          ],
        ),),
    );
  }
}


// Calls firebase to sign user out
void _signOut() async {
  await FirebaseAuth.instance.signOut();
}