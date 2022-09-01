import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:estore/components/colors.dart';
import 'package:estore/screens/favorite.dart';
import 'package:estore/screens/home.dart';
import 'package:estore/screens/login.dart';
import 'package:estore/screens/profile.dart';
import 'package:estore/screens/wallet.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;

  final List<Widget> _widgetScreen = <Widget>[
    PageHome(),
    WalletScreen(),
    FavoriteScreen(),
    LoginScreen(halaman: false,)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetScreen[_currentIndex],
      ),
      bottomNavigationBar: CustomNavigationBar(
        // isFloating: true,
        iconSize: 30.0,
        selectedColor: primaryColor,
        strokeColor: primaryColor,
        unSelectedColor: unselectedColor,
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            title: Text(
              "Home",
              style: TextStyle(
                  color: _currentIndex == 0 ? primaryColor : unselectedColor,
                  fontSize: 12,
                  height: 1.5,
                  fontWeight: FontWeight.w500),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            title: Text(
              "Wallet",
              style: TextStyle(
                  color: _currentIndex == 1 ? primaryColor : unselectedColor,
                  fontSize: 12,
                  height: 1.5,
                  fontWeight: FontWeight.w500),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.favorite_border_rounded),
            title: Text(
              "Favorite",
              style: TextStyle(
                  color: _currentIndex == 2 ? primaryColor : unselectedColor,
                  fontSize: 12,
                  height: 1.5,
                  fontWeight: FontWeight.w500),
            ),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.person_outline_rounded),
            title: Text(
              "Profile",
              style: TextStyle(
                  color: _currentIndex == 3 ? primaryColor : unselectedColor,
                  fontSize: 12,
                  height: 1.5,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
