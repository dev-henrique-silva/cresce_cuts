import 'package:flutter_modular/flutter_modular.dart';
import 'package:valevantagens/app/modules/common/common_module.dart';
import 'package:valevantagens/app/modules/discounts/discounts_modules.dart';
import 'package:valevantagens/app/modules/home/controllers/home_controller.dart';
import 'package:valevantagens/app/modules/home/services/home_service.dart';
import 'package:valevantagens/app/modules/home/views/home_page.dart';
import 'package:valevantagens/app/modules/home/views/view_product_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module(Modular.initialRoute, module: DiscountsModule());

    r.child(
      Modular.initialRoute,
      child: (_) => HomePage(
        controller: Modular.get(),
      ),
    );

    r.child(
      '/view_product',
      child: (_) => ViewProductPage(
        args: r.args.data,
      ),
    );
  }

  @override
  void binds(Injector i) {
    i.add(HomeService.new);
    i.add(
      () => HomeController(
        homeService: HomeService(
          dio: i.get(),
        ),
      ),
    );
  }
}
