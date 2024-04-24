// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_discount_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsDiscountController on _DetailsDiscountControllerBase, Store {
  late final _$discountAtom =
      Atom(name: '_DetailsDiscountControllerBase.discount', context: context);

  @override
  DiscountItemModel? get discount {
    _$discountAtom.reportRead();
    return super.discount;
  }

  @override
  set discount(DiscountItemModel? value) {
    _$discountAtom.reportWrite(value, super.discount, () {
      super.discount = value;
    });
  }

  late final _$updateDiscountAsyncAction = AsyncAction(
      '_DetailsDiscountControllerBase.updateDiscount',
      context: context);

  @override
  Future<dynamic> updateDiscount({required DiscountItemModel discountItem}) {
    return _$updateDiscountAsyncAction
        .run(() => super.updateDiscount(discountItem: discountItem));
  }

  late final _$fetchDiscountByIdAsyncAction = AsyncAction(
      '_DetailsDiscountControllerBase.fetchDiscountById',
      context: context);

  @override
  Future<DiscountItemModel?> fetchDiscountById({required int? id}) {
    return _$fetchDiscountByIdAsyncAction
        .run(() => super.fetchDiscountById(id: id));
  }

  @override
  String toString() {
    return '''
discount: ${discount}
    ''';
  }
}
