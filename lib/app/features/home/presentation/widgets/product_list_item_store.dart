import 'package:flutter_triple/flutter_triple.dart';

import 'package:shopys/app/core/error/failures.dart';

class ProductListItemStore extends NotifierStore<Exception, int> {
  ProductListItemStore() : super(0);

  increment() {
    try {
      update(state + 1);
      print(state);
    } catch (e) {
      setError(ErrorIncrement(error: e.toString()));
    }
  }

  decrement() {
    try {
      if (state != 0) {
        update(state - 1);
      }
    } catch (e) {
      setError(ErrorIncrement(error: e.toString()));
    }
  }

  reset() => update(0);
}
