import 'package:dio/dio.dart';
import 'package:valevantagens/app/constants/constants.dart';
import 'package:valevantagens/app/modules/home/models/product_model.dart';
import 'package:valevantagens/app/modules/home/services/i_home_service.dart';

class HomeService extends IHomeService {
  final Dio _dio;

  HomeService({required Dio dio}) : _dio = dio;

  @override
  Future<List<ProductModel>> fetchProducts() async {
    try {
      String url = '${UrlsConstants.API_URL}/products';

      Response response = await _dio.get(url);
      List result = response.data;
      return result.map((item) => ProductModel.fromMap(item)).toList();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
