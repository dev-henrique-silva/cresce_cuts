import 'package:flutter_modular/flutter_modular.dart';
import 'package:valevantagens/app/modules/discounts/views/discounts_page.dart';
import 'package:valevantagens/app/modules/discounts/views/register_discount_page.dart';

class DiscountsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/discount',
      child: (_) => DiscountsPage(),
    );

    r.child(
      '/register_discount',
      child: (_) => RegisterDiscountPage(
        args: r.args.data,
      ),
    );
  }
}
