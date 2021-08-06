import 'package:shopys/app/features/cart/cart_Page.dart';
import 'package:shopys/app/features/cart/cart_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CartPage()),
  ];
}
