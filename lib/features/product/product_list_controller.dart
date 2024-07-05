import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/product_list_model.dart';
import 'products_repositry.dart';

class ProductController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxList productList = <ProductSDataModel>[].obs;
  RxList favoriteList = <ProductSDataModel>[].obs;
  final ProductRepository _productRepository = ProductRepository();
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();

    super.onInit();
  }

  void fetchProducts() async {
    try {
      var products = await _productRepository.getProducts();
      if (products.isNotEmpty) {
        productList.value = products;
        await preloadImages(products);
        loadFavorites();
      }
    } catch (e) {
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavoriteStatus(ProductSDataModel product) {
    product.isFavorite = !product.isFavorite;
    if (product.isFavorite) {
      favoriteList.add(product);
    } else {
      favoriteList.remove(product);
    }
    saveFavPersistant();
    productList.refresh();
    favoriteList.refresh();
  }

  void saveFavPersistant() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> favIds = favoriteList.map((f) => f.id.toString()).toList();
    await pref.setStringList('favorites', favIds);
  }

  void loadFavorites() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? favIds = preferences.getStringList('favorites');
    if (favIds != null) {
      for (var product in productList) {
        if (favIds.contains(product.id.toString())) {
          product.isFavorite = true;
          favoriteList.add(product);
        }
      }
      productList.refresh();
      favoriteList.refresh();
    }
  }

  Future<void> preloadImages(List<ProductSDataModel> products) async {
    for (var product in products) {
      if (product.image != null) {
        await precacheImage(
            CachedNetworkImageProvider(product.image!), Get.context!);
      }
    }
  }
}
