import 'package:flutter_modular/flutter_modular.dart';
import 'package:valevantagens/app/modules/discounts/controllers/details_discount/details_discount_controller.dart';
import 'package:valevantagens/app/modules/discounts/controllers/discounts/discounts_controller.dart';
import 'package:valevantagens/app/modules/discounts/controllers/register_discount/register_discount_controller.dart';
import 'package:valevantagens/app/modules/discounts/services/database_service.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/discount_database.dart';
import 'package:valevantagens/app/modules/discounts/views/details_discount_page.dart';
import 'package:valevantagens/app/modules/discounts/views/discounts_page.dart';
import 'package:valevantagens/app/modules/discounts/views/register_discount_page.dart';

class DiscountsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/discount',
      child: (_) => DiscountsPage(discountController: Modular.get()),
    );

    r.child(
      '/details_discount',
      child: (_) => DetailsDiscountPage(
        args: r.args.data,
        detailsDiscountController: Modular.get(),
      ),
    );

    r.child(
      '/register_discount',
      child: (_) => RegisterDiscountPage(
        args: r.args.data,
        registerDiscountController: Modular.get(),
      ),
    );
  }

  @override
  void binds(Injector i) {
    i.add(DatabaseService.new);
    i.add(DiscountDatabase.new);
    i.add(() => RegisterDiscountController(discountDatabase: i.get()));
    i.add(() => DiscountController(discountDatabase: i.get()));
    i.add(() => DetailsDiscountController(discountDatabase: i.get()));
  }
}
