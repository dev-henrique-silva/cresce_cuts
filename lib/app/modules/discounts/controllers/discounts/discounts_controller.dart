import 'package:mobx/mobx.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/discount_database.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/i_discount_database.dart';
import 'package:valevantagens/app/modules/discounts/utils/date_activation_inactivation.dart';

part 'discounts_controller.g.dart';

class DiscountController = _DiscountControllerBase with _$DiscountController;

abstract class _DiscountControllerBase with Store {
  final IDiscountDatabase _discountDatabase;

  _DiscountControllerBase({required DiscountDatabase discountDatabase})
      : _discountDatabase = discountDatabase;

  @observable
  bool isLoading = false;

  @observable
  bool hideBottomAppBar = false;

  @observable
  List<DiscountItemModel>? discounts;

  @action
  Future fetchAllDatabase() async {
    discounts = await _discountDatabase.fetchAll();
  }

  @action
  Future deleteAllDatabase() async {
    await _discountDatabase.deleteAll();
    fetchAllDatabase();
  }

  @action
  Future deleteDiscount({required int id}) async {
    await _discountDatabase.delete(id);
    fetchAllDatabase();
  }

  @action
  Future updateDiscount({required DiscountItemModel discountItem}) async {
    await _discountDatabase.update(discountItem.toMapSqlfiteDatabase());
    fetchAllDatabase();
  }

  @action
  verifyActiveDiscounts(List<DiscountItemModel> discounts) {
    if (discounts.isNotEmpty) {
      for (var discount in discounts) {
        final isDiscountActivity = validateDiscountIsActive(
          activationDate: discount.dateActivation,
          inactivationDate: discount.dateInactivation,
        );

        if (isDiscountActivity && !discount.isActive) {
          var updatedDiscount = discount.copyWith(isActive: true);
          updateDiscount(discountItem: updatedDiscount);
        }
      }
    }
  }
}
