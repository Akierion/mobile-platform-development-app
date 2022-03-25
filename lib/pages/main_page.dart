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
  // ----------------------------------------
  /*                  Icons                     */
  /* Icons used --> https://api.flutter.dev/flutter/material/Icons-class.html */
  Icon searchIcon = const Icon(IconData(0xe567, fontFamily: 'MaterialIcons'));
  Icon settingsIcon = const Icon(IconData(0xe57f, fontFamily: 'MaterialIcons'));
  Icon homeIcon = const Icon(IconData(0xf107, fontFamily: 'MaterialIcons'));
  Icon breakfastIcon = const Icon(IconData(0xf01c, fontFamily: 'MaterialIcons')); // breakfast_dining_outlined
  Icon lunchIcon = const Icon(IconData(0xf1a8, fontFamily: 'MaterialIcons')); // lunch_dining_outlined
  Icon dessertIcon = const Icon(IconData(0xef0f, fontFamily: 'MaterialIcons'));
  Icon checklistIcon = const Icon(IconData(0xef4b, fontFamily: 'MaterialIcons'));
  Icon addIcon = const Icon(Icons.add_circle_outline); // for floating button

  // ----------------------------------------
  int currentIndex = 0;
  List pages = [
    // By storing app pages in a list, it means that because we use index to count the pages, we can use index again to
    // call the page (if they are listed in the correct order of course).
    HomePage(),
    BreakfastPage(),
    MealsPage(),
    DessertsPage(),
    ToDoListPage(),
    SettingsPage(),
  ];
  // ----------------------------------------

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex], // Use the index (which is changed when a bottom navigation bar item is tapped (onTap)) for each page
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap, // Calls the function onTap (which changes the currentIndex to the index of the page you clicked, in essence, calling that page in the list with that index)
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed, // Fixes the color scheme provided below to the bottom navigation bar (if dark mode was implemented, this would be taken out to allow it to be dynamic)
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black54, // When an item is selected, change it's color (to help the user identify that is the tab they are on)
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false, // If unselected, don't show labels e.g. Home, breakfast, meals, my list and settings
        showSelectedLabels: true, // If selected, show labels
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: homeIcon, label: 'Home',),
          BottomNavigationBarItem(
            icon: breakfastIcon, label: 'Breakfast',),
          BottomNavigationBarItem(
            icon: lunchIcon, label: 'Meals',),
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
