import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopys/app/features/home/home_module.dart';
import 'package:shopys/app/shared/bottom_navigation/bottom_navigation_store.dart';
import 'package:shopys/app/features/cart/cart_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //! Stores
    Bind((i) => CartStore(i())),
    Bind((i) => BottomNavigationStore(index: 0)),

    //! UseCases
    //! DataSources
    //! Repositories
    //! General
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute("/home", module: HomeModule()),
  ];
}
