import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/features/cart/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:shopys/app/features/cart/widgets/product_item.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key? key, this.title = 'CartPage'}) : super(key: key);
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  CartStore store = Modular.get<CartStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: ScopedBuilder<CartStore, Exception, Map<ProductEntity, int>>(
        store: store,
        onState: (_, item) => Column(
          children: [
            ...item.entries.map((e) => ProductItem(productCart: e)).toList()
          ],
        ),
        onError: (_, e) => Text("Houve um erro ${e.toString()}"),
        onLoading: (_) => CircularProgressIndicator(),
      ),
    );
  }
}
