import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/features/cart/cart_page.dart';
import 'package:shopys/app/features/home/presentation/home_page.dart';

class BottomNavigationStore extends NotifierStore<Exception, int> {
  final int index;

  final List<Widget> screens = [
    HomePage(),
    CartPage(),
  ];

  BottomNavigationStore({
    this.index = 0,
  }) : super(index);

  void onTabTapped(int index) {
    update(index);
  }
}
