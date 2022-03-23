import 'package:first_prototype/pages/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

// youtube.com/watch?v=FnXg0NK6hb8 -- For Help on Settings

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
    return Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.all(10.0),
            child: Text('Settings', style: TextStyle(fontFamily: 'Rubik', fontSize: 25.0,), textAlign: TextAlign.center)),
            SizedBox(
                height: 40),
            Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 10),
                  Text('Account', style: TextStyle(fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rubik'),)
                ]
            ),
            Divider(height: 20, thickness: 1,),
            SizedBox(height: 10),
            buildAccountOption(context, 'Change Password', 'Change Password Here'),
            buildAccountOption(context, 'Language', 'Languages Here'),
            buildAccountOption(context, 'Privacy and Security', 'Privacy and Security Here'),
            buildAccountOption(context, 'Terms and Conditions', 'Terms and Conditions Here'),
            SizedBox(height: 40),
            Row(
              children: [ // Preference Settings
                Icon(Icons.volume_up_outlined),
                SizedBox(width: 10),
                Text('Preferences', style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Rubik',
                )),
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildNotificationOption('Dark Theme', valNotify1, onChangeFunction1),
            SizedBox(height: 50),
            Center ( // Sign out button
              child: OutlinedButton (
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
                onPressed: (){},
                child: Text('SIGN OUT', style: TextStyle(
                  fontSize: 16, letterSpacing: 2.2, color: Colors.black),
                ),
                ),
            ),
          ],
        )
    );
  }

  Padding buildNotificationOption(String title, bool value, Function OnChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle( // Builds the preferences menu for each preference defined in the buildNotificationOption function on lines 41-43
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rubik',
          )),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.green,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {

                //ThemeData.from(colorScheme: ColorScheme.dark());
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
          return AlertDialog(
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
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),),
    );
  }
}