import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';
import 'package:shopys/app/features/home/presentation/widgets/product_list_item.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    store.getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text('Shopys'),
        backgroundColor: Colors.black,
      ),
      body: ScopedBuilder<HomeStore, Exception, List<ProductEntity>>(
        store: store,
        onState: (_, list) {
          return SafeArea(
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ProductListItem(product: list[index]);
                }),
          );
        },
        onError: (context, error) => Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
        onLoading: (context) => Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: Material(
          elevation: 7.0,
          color: Colors.white,
          child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.white,
                      child: Icon(
                        Icons.shopping_basket,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.white,
                      child: Icon(
                        Icons.account_box,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.white,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      color: Colors.white,
                      child: Icon(
                        Icons.account_box,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ]),
              ))),
    );
  }
}
