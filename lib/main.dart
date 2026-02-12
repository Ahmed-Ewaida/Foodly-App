import 'package:flutter/material.dart';
import 'package:foodly/cart_screen.dart';
import 'package:foodly/profile_screen.dart';
import 'home_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    int  _selectedIndex=0;
  final List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];
  List <AppBar> appbers=[
    AppBar(
      title: Text(
        "Food Delivery",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart, size: 24),
        ),
        SizedBox(width: 10),
      ],
    ),
    AppBar(
      title:Text("Cart",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
    ),
    AppBar(),
  ];
  final List<Widget> screens = const [
    HomeScreen(),
    CartScreen(),
    UserInfoView(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(
      appBar: appbers[_selectedIndex],
      body: screens[_selectedIndex],
    bottomNavigationBar: BottomNavigationBar(
    currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.grey,
    items: navItems,
    )));
  }
}


