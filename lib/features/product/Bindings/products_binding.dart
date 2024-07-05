import 'package:get/get.dart';

import '../product_list_controller.dart';

class ProductsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
