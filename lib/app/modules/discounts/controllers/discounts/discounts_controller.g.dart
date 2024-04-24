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
  List<DiscountItemModel>? get discounts {
    _$discountsAtom.reportRead();
    return super.discounts;
  }

  @override
  set discounts(List<DiscountItemModel>? value) {
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

  late final _$deleteAllDatabaseAsyncAction = AsyncAction(
      '_DiscountControllerBase.deleteAllDatabase',
      context: context);

  @override
  Future<dynamic> deleteAllDatabase() {
    return _$deleteAllDatabaseAsyncAction.run(() => super.deleteAllDatabase());
  }

  late final _$deleteDiscountAsyncAction =
      AsyncAction('_DiscountControllerBase.deleteDiscount', context: context);

  @override
  Future<dynamic> deleteDiscount({required int id}) {
    return _$deleteDiscountAsyncAction.run(() => super.deleteDiscount(id: id));
  }

  late final _$updateDiscountAsyncAction =
      AsyncAction('_DiscountControllerBase.updateDiscount', context: context);

  @override
  Future<dynamic> updateDiscount({required DiscountItemModel discountItem}) {
    return _$updateDiscountAsyncAction
        .run(() => super.updateDiscount(discountItem: discountItem));
  }

  late final _$_DiscountControllerBaseActionController =
      ActionController(name: '_DiscountControllerBase', context: context);

  @override
  dynamic verifyActiveDiscounts(List<DiscountItemModel> discounts) {
    final _$actionInfo = _$_DiscountControllerBaseActionController.startAction(
        name: '_DiscountControllerBase.verifyActiveDiscounts');
    try {
      return super.verifyActiveDiscounts(discounts);
    } finally {
      _$_DiscountControllerBaseActionController.endAction(_$actionInfo);
    }
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
