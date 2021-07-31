import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource_impl.dart';
import 'package:shopys/app/features/home/data/datasources/product_datasource_local_impl.dart';
import 'package:shopys/app/features/home/data/repositories/product_repository_impl.dart';
import 'package:shopys/app/features/home/domain/usecases/get_product_list_usecase.dart';
import 'package:shopys/app/features/home/presentation/home_page.dart';
import 'package:shopys/app/features/home/presentation/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    //! Stores
    Bind.lazySingleton((i) => HomeStore(i())),

    //! UseCases
    Bind((i) => GetProductListUsecase(i())),

    //! DataSources
    Bind((i) => ProductDataSource(i())),
    Bind((i) => ProductLocalDataSource(i())),

    //! Repositories
    Bind((i) => ProductRepositoryImpl(i())),

    //! General
    Bind((i) => Dio()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
