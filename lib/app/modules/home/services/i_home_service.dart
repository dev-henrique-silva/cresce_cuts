import 'package:valevantagens/app/modules/home/models/product_model.dart';

abstract class IHomeService {
  Future<List<ProductModel>> fetchProducts();
}
