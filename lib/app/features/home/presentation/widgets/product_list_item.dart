import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopys/app/core/styles/sizes/app_sizes.dart';

import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

class ProductListItem extends StatelessWidget {
  final ProductEntity product;

  const ProductListItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final double radius = 16;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Modular.to.navigate('/products/${product.name}'),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.s8),
        child: Container(
          height: 300,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Hero(
                  tag: product.photoUrl,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(product.photoUrl),
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
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(
                    top: AppSizes.s16,
                    left: AppSizes.s16,
                    right: AppSizes.s16,
                    bottom: AppSizes.s16,
                  ),
                  child: Column(
                    children: [
                      Text(product.name),
                      SizedBox(
                        height: AppSizes.s16,
                      ),
                      Expanded(
                        child: Text(
                          product.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
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
