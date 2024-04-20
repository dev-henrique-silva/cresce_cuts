import 'package:flutter_modular/flutter_modular.dart';
import 'package:valevantagens/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager router) {
    router.module(Modular.initialRoute, module: HomeModule());
  }
}
