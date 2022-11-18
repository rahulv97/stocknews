import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stocknews/helpers/colors_helper.dart';
import 'package:stocknews/screens/chartscreen/chartscreen.dart';
import 'package:stocknews/screens/homepage/homescreen.dart';
import 'package:stocknews/screens/livetv/livetv.dart';
import 'package:stocknews/screens/topstocks/topstock.dart';
import 'package:stocknews/screens/watchlist/watchlist.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: bgimage,
        showElevation: true,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
          _pageController.jumpToPage(index);
        }),
        items: [
          BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: leftgradient),
          BottomNavyBarItem(
              icon: const Icon(Icons.newspaper),
              title: const Text('News'),
              activeColor: leftgradient),
          BottomNavyBarItem(
              icon: const Icon(Icons.bar_chart),
              title: const Text('Watchlist'),
              activeColor: leftgradient),
          BottomNavyBarItem(
              icon: const Icon(Icons.stacked_line_chart_rounded),
              title: const Text('Top Market'),
              activeColor: leftgradient),
          BottomNavyBarItem(
              icon: const Icon(Icons.tv),
              title: const Text('Live Tv'),
              activeColor: leftgradient),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _selectedIndex = index);
        },
        children: const <Widget>[
          HomePage(),
          ChartScreen(),
          WatchList(),
          TopStockPage(),
          LiveTv(),
        ],
      ),
    );
  }
}
