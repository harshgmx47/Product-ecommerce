import 'package:http/http.dart' as http;
import '../../../utils/constants.dart';
import '../models/product_list_model.dart';

class ProductsRemoteDataSource {
  // static const String baseUrl =
  //     "https://fakestoreapi.com/products";

  Future<List<ProductSDataModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseURL + productURL));

    if (response.statusCode == 200) {
      return productSDataModelFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
