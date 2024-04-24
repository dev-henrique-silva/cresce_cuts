import 'package:mobx/mobx.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/discount_database.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/i_discount_database.dart';

part 'details_discount_controller.g.dart';

class DetailsDiscountController = _DetailsDiscountControllerBase
    with _$DetailsDiscountController;

abstract class _DetailsDiscountControllerBase with Store {
  final IDiscountDatabase _discountDatabase;

  _DetailsDiscountControllerBase({required DiscountDatabase discountDatabase})
      : _discountDatabase = discountDatabase;

  @observable
  DiscountItemModel? discount;

  @action
  Future updateDiscount({required DiscountItemModel discountItem}) async {
    await _discountDatabase.update(discountItem.toMapSqlfiteDatabase());
    if (discountItem.id != null) {
      return fetchDiscountById(id: discountItem.id!);
    }
  }

  @action
  Future<DiscountItemModel?> fetchDiscountById({required int? id}) async {
    if (id != null) {
      discount = await _discountDatabase.fetchById(id);
    }

    return discount;
  }
}
