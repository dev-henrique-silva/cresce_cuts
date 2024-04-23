import 'package:mobx/mobx.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/discount_database.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/i_discount_database.dart';

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
  ObservableFuture<List<DiscountItemModel>>? discounts;

  @action
  Future fetchAllDatabase() async {
    discounts = ObservableFuture(
      _discountDatabase.fetchAll(),
    );
  }
}
