import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodly/cart_screen.dart';
import 'package:foodly/cubit/app_cubit.dart';
import 'package:foodly/cubit/app_state.dart';
import 'package:foodly/favorites_screen.dart';
import 'package:foodly/profile_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const _AppScaffold(),
      ),
    );
  }
}

class _AppScaffold extends StatelessWidget {
  const _AppScaffold();

  static const List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  static final List<PreferredSizeWidget> appBars = [
    AppBar(
      title: const Text(
        "Food Delivery",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
      ),
      centerTitle: true,
      actions: const [
        Icon(Icons.shopping_cart, size: 24),
        SizedBox(width: 10),
      ],
    ),
    AppBar(
      title: const Text(
        "Favorites",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    AppBar(
      title: const Text(
        "Cart",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
    AppBar(),
  ];

  static const List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    UserInfoView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: appBars[state.selectedIndex],
          body: screens[state.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.selectedIndex,
            onTap: (index) => context.read<AppCubit>().setSelectedIndex(index),
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            items: navItems,
          ),
        );
      },
    );
  }
}
