// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadingErrorAtom =
      Atom(name: '_HomeControllerBase.loadingError', context: context);

  @override
  bool get loadingError {
    _$loadingErrorAtom.reportRead();
    return super.loadingError;
  }

  @override
  set loadingError(bool value) {
    _$loadingErrorAtom.reportWrite(value, super.loadingError, () {
      super.loadingError = value;
    });
  }

  late final _$productFutureAtom =
      Atom(name: '_HomeControllerBase.productFuture', context: context);

  @override
  ObservableFuture<List<ProductModel>>? get productFuture {
    _$productFutureAtom.reportRead();
    return super.productFuture;
  }

  @override
  set productFuture(ObservableFuture<List<ProductModel>>? value) {
    _$productFutureAtom.reportWrite(value, super.productFuture, () {
      super.productFuture = value;
    });
  }

  late final _$fetchProductsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchProducts', context: context);

  @override
  Future<dynamic> fetchProducts() {
    return _$fetchProductsAsyncAction.run(() => super.fetchProducts());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
loadingError: ${loadingError},
productFuture: ${productFuture}
    ''';
  }
}
