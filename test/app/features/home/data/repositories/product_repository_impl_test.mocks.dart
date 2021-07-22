// Mocks generated by Mockito 5.0.11 from annotations
// in shopys/test/app/features/home/data/repositories/product_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:shopys/app/features/home/data/datasources/product_datasource.dart'
    as _i2;
import 'package:shopys/app/features/home/data/models/product_model.dart' as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [IProductDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIProductDataSource extends _i1.Mock
    implements _i2.IProductDataSource {
  MockIProductDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ProductModel>> getProductList() =>
      (super.noSuchMethod(Invocation.method(#getProductList, []),
              returnValue:
                  Future<List<_i4.ProductModel>>.value(<_i4.ProductModel>[]))
          as _i3.Future<List<_i4.ProductModel>>);
}