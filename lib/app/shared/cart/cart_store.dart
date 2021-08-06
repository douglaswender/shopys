import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/core/error/exceptions.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

class CartStore extends NotifierStore<Exception, Map<ProductEntity, int>> {
  final Map<ProductEntity, int> cart;

  CartStore(this.cart) : super(cart);

  Future<void> add(ProductEntity product, int quantity) async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 1));
    try {
      cart.update(product, (value) {
        int newValue = cart[product]! + value;
        return newValue;
      }, ifAbsent: () => quantity);
      update(cart);
      cart.forEach((key, value) {
        print(key.name + " - " + value.toString());
      });
    } catch (e) {
      setError(ServerException());
    }
  }

  Future<void> remove() async {}
}