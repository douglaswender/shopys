import 'package:shopys/app/feature/products/products_Page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopys/app/features/products/products_store.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProductsPage()),
  ];
}
