import 'package:flutter_modular/flutter_modular.dart';
import 'package:valevantagens/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager router) {
    router.child(Modular.initialRoute, child: (_) => HomePage());
  }
}
