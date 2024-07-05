import 'RemoteService/productRemoteService.dart';
import 'models/product_list_model.dart';

class ProductRepository {
  static final ProductRepository _instance = ProductRepository._internal();
  late ProductsRemoteDataSource _productsRemoteDataSource;

  factory ProductRepository() {
    _instance._productsRemoteDataSource = ProductsRemoteDataSource();
    return _instance;
  }

  ProductRepository._internal();

  Future<List<ProductSDataModel>> getProducts() async {
    return await _productsRemoteDataSource.fetchProducts();
  }
}
