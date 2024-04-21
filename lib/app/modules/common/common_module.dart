import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CommonModule extends Module {
  @override
  void exportedBinds(Injector inject) {
    inject.addSingleton(() => Dio());
  }
}
