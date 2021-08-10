import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/core/styles/sizes/app_sizes.dart';
import 'package:shopys/app/core/utils/currency.dart';
import 'package:shopys/app/features/cart/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:shopys/app/features/cart/widgets/product_item.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key? key, this.title = 'Carrinho'}) : super(key: key);
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  CartStore store = Modular.get<CartStore>();

  @override
  void initState() {
    super.initState();
  }

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
        onState: (_, item) => item.entries.length > 0
            ? ListView(
                children: [
                  ...item.entries
                      .map((e) => ProductItem(productCart: e))
                      .toList()
                ],
              )
            : Center(
                child: Text('Não há items no seu carrinho!'),
              ),
        onError: (_, e) => Text("Houve um erro ${e.toString()}"),
        onLoading: (_) => CircularProgressIndicator(),
      ),
      bottomNavigationBar:
          ScopedBuilder<CartStore, Exception, Map<ProductEntity, int>>(
        store: store,
        onState: (_, cart) => Container(
            color: Colors.grey[400],
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:"),
                Text(
                  Currency.toCurrency(store.total()),
                  style: TextStyle(fontSize: AppSizes.s24),
                ),
              ],
            )),
        onError: (_, e) => Text("Houve um erro! $e"),
        onLoading: (_) => CircularProgressIndicator(),
      ),
    );
  }
}
