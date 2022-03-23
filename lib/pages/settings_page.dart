import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// youtube.com/watch?v=FnXg0NK6hb8 -- For Help on Settings

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = true;

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
            buildAccountOption(context, "Change Password"),
            buildAccountOption(context, "Language"),
            buildAccountOption(context, "Privacy and Security"),
            SizedBox(height: 40),
            Row(
              children: [
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
            Center(
              child: OutlinedButton (
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
                onPressed: (){},
                child: Text('SIGN OUT', style: TextStyle(
                  fontSize: 16, letterSpacing: 2.2, color: Colors.black)
                ),
                ),),
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
          Text(title, style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Rubik',
          )),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.black,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                OnChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Option 1'),
                Text('Option 2'),
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
      child: Padding(
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