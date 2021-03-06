import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/core/styles/sizes/app_sizes.dart';
import 'package:shopys/app/core/utils/currency.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';
import 'package:shopys/app/features/cart/cart_store.dart';
import 'package:shopys/app/features/home/presentation/widgets/product_list_item_store.dart';

class ProductListItem extends StatefulWidget {
  final ProductEntity product;
  final int? quantity;

  const ProductListItem({
    Key? key,
    required this.product,
    this.quantity = 0,
  }) : super(key: key);

  @override
  _ProductListItemState createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  final ProductListItemStore store = ProductListItemStore();
  final CartStore cart = Modular.get<CartStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.s8),
      height: 350,
      child: Column(
        children: [
          Expanded(
            child: Hero(
              tag: widget.product.photoUrl,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.product.photoUrl),
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.s16),
                      topRight: Radius.circular(AppSizes.s16),
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: AppSizes.s16,
                left: AppSizes.s16,
                right: AppSizes.s16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: AppSizes.s8,
                  ),
                  Text(
                    widget.product.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScopedBuilder(
                        store: store,
                        onState: (_, int state) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => store.decrement(),
                              icon: Icon(
                                Icons.remove,
                                size: 32,
                              ),
                            ),
                            Container(
                              child: Text(
                                store.state.toString(),
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            IconButton(
                              onPressed: () => store.increment(),
                              icon: Icon(
                                Icons.add,
                                size: 32,
                              ),
                            ),
                          ],
                        ),
                        onError: (_, exception) => Text('Fora do estoque!'),
                      ),
                      Text(
                        Currency.toCurrency(widget.product.price),
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  ScopedBuilder(
                    store: store,
                    onState: (_, quantity) => Expanded(
                      child: Container(
                        width: double.maxFinite,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange[300],
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSizes.s16),
                              ),
                            ),
                            onPressed: store.state > 0
                                ? () => cart.add(widget.product, store.state)
                                : null,
                            child: Text(
                              "Adicionar ao carrinho",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.s8,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSizes.s16),
                    bottomRight: Radius.circular(AppSizes.s16),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
