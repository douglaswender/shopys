import 'package:flutter_triple/flutter_triple.dart';
import 'package:shopys/app/core/usecase/usecase.dart';
import 'package:shopys/app/features/home/domain/entities/product_entity.dart';
import 'package:shopys/app/features/home/domain/usecases/get_product_list_usecase.dart';

class HomeStore extends NotifierStore<Exception, List<ProductEntity>> {
  final GetProductListUsecase getProductListUsecase;

  HomeStore(this.getProductListUsecase) : super([]);

  Future<void> getProductList() async {
    setLoading(true);

    final result = await getProductListUsecase(NoParams());

    result.fold(
      (l) => setError(l),
      (r) => update(r),
    );
  }
}
