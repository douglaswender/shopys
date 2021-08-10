import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/core/styles/sizes/app_sizes.dart';
import 'package:shopys/app/core/utils/currency.dart';
import 'package:shopys/app/features/cart/cart_store.dart';

import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

class ProductItem extends StatefulWidget {
  final MapEntry<ProductEntity, int> productCart;
  const ProductItem({
    Key? key,
    required this.productCart,
  }) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final CartStore cart = Modular.get<CartStore>();

  @override
  void initState() {
    super.initState();
    print(widget.productCart.key);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<CartStore, Exception, Map<ProductEntity, int>>(
      store: cart,
      onState: (_, quantity) => Container(
        padding: EdgeInsets.all(AppSizes.s16),
        height: 200,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.productCart.key.photoUrl),
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.s16),
                      bottomLeft: Radius.circular(AppSizes.s16),
                    )),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                padding: EdgeInsets.all(AppSizes.s16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.productCart.key.name,
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "X " + widget.productCart.value.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              Currency.toCurrency(widget.productCart.key.price),
                            ),
                            Text(
                              Currency.toCurrency(widget.productCart.key.price *
                                  widget.productCart.value),
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => cart.remove(widget.productCart.key),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(AppSizes.s16),
                      bottomRight: Radius.circular(AppSizes.s16),
                    ),
                  ),
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Center(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
