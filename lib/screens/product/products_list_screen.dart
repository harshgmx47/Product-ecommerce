import 'package:ecom/CustomWidgets/custom_drawer.dart';
import 'package:ecom/screens/product/product_details_screen.dart';
import 'package:ecom/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../CustomWidgets/shimmer_grid.dart';
import '../../features/product/product_list_controller.dart';
import '../wishList/fav_screen.dart';

class ProductListScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: productController.scaffoldKey,
      backgroundColor: MyColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            productController.scaffoldKey.currentState!
                .openDrawer(); // Open drawer
          },
        ),
        backgroundColor: MyColors.white,
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Get.to(() => FavoriteListScreen());
            },
          ),
        ],
      ),
      drawer: CustomDrawer(
        context: context,
      ),
      body: Obx(() {
        if (productController.isLoading.value) {
          return ShimmerGrid();
        } else {
          return GridView.builder(
            itemCount: productController.productList.isNotEmpty
                ? productController.productList.length
                : 0,
            itemBuilder: (context, index) {
              final product = productController.productList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                  product: product,
                                )));
                  },
                  child: Card(
                    elevation: 8,
                    color: MyColors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: product.image ?? '',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.title!,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$${product.price}"),
                              IconButton(
                                onPressed: () {
                                  productController
                                      .toggleFavoriteStatus(product);
                                },
                                icon: Icon(
                                  product.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: product.isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.78,
            ),
          );
        }
      }),
    );
  }
}
