import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

class CartModel {
  final Map<ProductEntity, int> cart;

  CartModel(this.cart);
}
