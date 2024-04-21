import 'package:mobx/mobx.dart';
import 'package:valevantagens/app/modules/home/models/product_model.dart';
import 'package:valevantagens/app/modules/home/services/home_service.dart';
import 'package:valevantagens/app/modules/home/services/i_home_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final IHomeService _homeService;

  _HomeControllerBase({required HomeService homeService})
      : _homeService = homeService;

  @observable
  bool isLoading = false;

  @observable
  bool loadingError = false;

  @observable
  ObservableFuture<List<ProductModel>>? productFuture;

  @action
  Future fetchProducts() async {
    productFuture = ObservableFuture(
      _homeService.fetchProducts(),
    );
  }
}
