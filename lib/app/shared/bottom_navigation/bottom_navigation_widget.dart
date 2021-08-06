import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/shared/bottom_navigation/bottom_navigation_store.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationStore navigation =
        Modular.get<BottomNavigationStore>();

    return ScopedBuilder<BottomNavigationStore, Exception, int>(
      store: navigation,
      onState: (_, index) => Scaffold(
        body: navigation.screens[index],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          currentIndex: index,
          onTap: navigation.onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Carrinho",
            ),
          ],
        ),
      ),
    );
  }
}
