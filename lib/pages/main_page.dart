//import 'dart:ffi';

import 'package:first_prototype/pages/breakfast_page.dart';
import 'package:first_prototype/pages/meals_page.dart';
import 'package:first_prototype/pages/settings_page.dart';
import 'package:first_prototype/pages/todolist_page.dart';
import 'package:flutter/material.dart';

import 'desserts_page.dart';
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
  Icon homeIcon = const Icon(IconData(0xf107, fontFamily: 'MaterialIcons'));
  Icon breakfastIcon = const Icon(IconData(0xf01c, fontFamily: 'MaterialIcons')); // breakfast_dining_outlined
  Icon lunchIcon = const Icon(IconData(0xf1a8, fontFamily: 'MaterialIcons')); // lunch_dining_outlined
  //Icon dinnerIcon = const Icon(IconData(0xefbf, fontFamily: 'MaterialIcons')); // dinner_dining_outlined
  Icon dessertIcon = const Icon(IconData(0xef0f, fontFamily: 'MaterialIcons'));
  Icon checklistIcon = const Icon(IconData(0xef4b, fontFamily: 'MaterialIcons'));
  Icon addIcon = const Icon(Icons.add_circle_outline); // for floating button
  int currentIndex = 0;
  List pages = [
    // by storing app pages in a list, it means that because we use index to count the pages, we can use index again to
    // call the page (if they are listed in the correct order of course).
    HomePage(),
    BreakfastPage(),
    MealsPage(),
    DessertsPage(),
    //CreateNewRecipePage(),
    ToDoListPage(),
    SettingsPage(),
  ];

  MainPageAppbar () {
    return AppBar(
      // leading:
      // IconButton(onPressed: (){}, tooltip: 'Login', icon: loginIcon,), // Adds a login icon button to the left of the title
      title: Text('Recipes Necessities', style: TextStyle(fontSize: 20, fontFamily: 'Rubik', fontWeight: FontWeight.bold, color: Colors.black)),
      // centerTitle: true,
      foregroundColor: Colors.grey[700],
      backgroundColor: Colors.white,
      actions: [ // Adds a settings and search icon button to the right of the title
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
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: homeIcon, label: 'Home',),
          BottomNavigationBarItem(
            icon: breakfastIcon, label: 'Breakfast',),
          BottomNavigationBarItem(
            icon: lunchIcon, label: 'Lunch',),
          BottomNavigationBarItem(
              icon: dessertIcon, label: 'Dessert'),
          BottomNavigationBarItem(
              icon: checklistIcon, label: 'My List'),
          BottomNavigationBarItem(
              icon: settingsIcon, label: 'Settings'),
        ],
      )
    );
  }
}
