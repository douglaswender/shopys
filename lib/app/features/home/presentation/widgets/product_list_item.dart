import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:shopys/app/core/styles/sizes/app_sizes.dart';
import 'package:shopys/app/core/utils/currency.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';
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

class _ProductListItemState extends ModularState<ProductListItem, ProductListItemStore> {
  final double radius = 16;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.navigate('/products/${widget.product.name}'),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.s8),
        child: Container(
          height: 500,
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.product.photoUrl,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.product.photoUrl),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(radius),
                          topRight: Radius.circular(radius),
                        )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  padding: EdgeInsets.only(
                    top: AppSizes.s16,
                    left: AppSizes.s16,
                    right: AppSizes.s16,
                    bottom: AppSizes.s16,
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.product.name,
                        style: TextStyle(fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: AppSizes.s16,
                      ),
                      Text(
                        widget.product.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(
                        height: AppSizes.s16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.remove,
                                  size: 32,
                                ),
                              ),
                              Container(
                                child: Text(
                                  widget.quantity.toString(),
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  size: 32,
                                ),
                              ),
                            ],
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
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
