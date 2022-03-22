//import 'dart:ffi';

import 'package:first_prototype/pages/breakfast_page.dart';
import 'package:first_prototype/pages/create_new_recipe_page.dart';
import 'package:first_prototype/pages/dinner_page.dart';
import 'package:first_prototype/pages/lunch_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Icons used / variables created
  Icon searchIcon = const Icon(IconData(0xe567, fontFamily: 'MaterialIcons'));
  Icon settingsIcon = const Icon(IconData(0xe57f, fontFamily: 'MaterialIcons'));
  Icon loginIcon = const Icon(Icons.account_circle_rounded);
  Icon addIcon = const Icon(Icons.add_circle_outline);
  Icon homeIcon = const Icon(IconData(0xf107, fontFamily: 'MaterialIcons'));
  Icon breakfastIcon = const Icon(IconData(0xeef3, fontFamily: 'MaterialIcons')); // breakfast_dining_outlined
  Icon lunchIcon = const Icon(IconData(0xf1a8, fontFamily: 'MaterialIcons')); // lunch_dining_outlined
  Icon dinnerIcon = const Icon(IconData(0xefbf, fontFamily: 'MaterialIcons')); // dinner_dining_outlined
  int currentIndex = 0;
  List pages = [
    HomePage(),
    BreakfastPage(),
    LunchPage(),
    DinnerPage(),
    CreateNewRecipePage(),
  ];

  MainPageAppbar () {
    return AppBar(
      leading:
      IconButton(onPressed: (){}, tooltip: 'Login', icon: loginIcon,), // Adds a login icon button to the left of the title
      title: Text('Recipes Necessities', style: TextStyle(fontSize: 20, fontFamily: 'Rubik')),
      centerTitle: true,
      foregroundColor: Colors.grey[700],
      backgroundColor: Colors.white,
      actions: [ // Adds a settings and search icon button to the right of the title
        IconButton(onPressed: (){}, tooltip: 'Settings', icon: settingsIcon,),
        IconButton(onPressed: (){}, tooltip: 'Search', icon: searchIcon,),
      ],
    );
  }

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainPageAppbar(),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: homeIcon, label: 'Home',),
          BottomNavigationBarItem(
            icon: breakfastIcon, label: 'Breakfast',),
          BottomNavigationBarItem(
            icon: lunchIcon, label: 'Lunch',),
          BottomNavigationBarItem(
            icon: dinnerIcon, label: 'Dinner',),
          BottomNavigationBarItem(
              icon: addIcon, label: 'Add New Recipe',)
        ],
      )
    );
  }
}
