import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopys/app/features/cart/cart_store.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key? key, this.title = 'CartPage'}) : super(key: key);
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  final CartStore store = Modular.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: [
        ...store.cart.entries.map((e) => Text(e.key.name)).toList()
      ]),
    );
  }
}
