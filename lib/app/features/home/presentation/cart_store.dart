import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';

class CartStore extends NotifierStore<Exception, Map<ProductEntity, int>> {
  CartStore(Map<ProductEntity, int> initialState) : super(initialState);
}
