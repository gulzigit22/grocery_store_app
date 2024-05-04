import 'package:flutter/material.dart';
import 'package:grocery_store_app/page/chat/chat_page.dart';
import 'package:grocery_store_app/page/profil/profil.dart';
import 'package:grocery_store_app/screen/header_parts.dart';
import 'package:grocery_store_app/screen/items_diplay.dart';
import 'package:grocery_store_app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ChatPage(),
    ProfailPage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Center(
          child: SingleChildScrollView(
            child: Column(
              children: [HeaderParts(), ItemsDisplay()],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            showSelectedLabels: false,
            selectedItemColor: primaryColors,
            unselectedItemColor: Colors.green[200],
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                  ),
                  label: 'Chat'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: 'Cart'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'person'),
            ]),
      ),
    );
  }
}
