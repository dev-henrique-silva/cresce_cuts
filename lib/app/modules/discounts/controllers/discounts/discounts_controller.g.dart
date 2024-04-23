// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discounts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DiscountController on _DiscountControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_DiscountControllerBase.isLoading', context: context);

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

  late final _$hideBottomAppBarAtom =
      Atom(name: '_DiscountControllerBase.hideBottomAppBar', context: context);

  @override
  bool get hideBottomAppBar {
    _$hideBottomAppBarAtom.reportRead();
    return super.hideBottomAppBar;
  }

  @override
  set hideBottomAppBar(bool value) {
    _$hideBottomAppBarAtom.reportWrite(value, super.hideBottomAppBar, () {
      super.hideBottomAppBar = value;
    });
  }

  late final _$discountsAtom =
      Atom(name: '_DiscountControllerBase.discounts', context: context);

  @override
  ObservableFuture<List<DiscountItemModel>>? get discounts {
    _$discountsAtom.reportRead();
    return super.discounts;
  }

  @override
  set discounts(ObservableFuture<List<DiscountItemModel>>? value) {
    _$discountsAtom.reportWrite(value, super.discounts, () {
      super.discounts = value;
    });
  }

  late final _$fetchAllDatabaseAsyncAction =
      AsyncAction('_DiscountControllerBase.fetchAllDatabase', context: context);

  @override
  Future<dynamic> fetchAllDatabase() {
    return _$fetchAllDatabaseAsyncAction.run(() => super.fetchAllDatabase());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hideBottomAppBar: ${hideBottomAppBar},
discounts: ${discounts}
    ''';
  }
}
