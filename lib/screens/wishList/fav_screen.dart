import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/features/product/product_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class FavoriteListScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  FavoriteListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Obx(() {
        if (productController.favoriteList.isEmpty) {
          return const Center(
            child: Text('No favorite products yet'),
          );
        } else {
          return GridView.builder(
            itemCount: productController.favoriteList.length,
            itemBuilder: (context, index) {
              final product = productController.favoriteList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Card(
                  color: MyColors.white,
                  shadowColor: Colors.black,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                        const SizedBox(height: 15),
                        Text(
                          product.title!,
                          maxLines: 2,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1 / 0.80,
                mainAxisSpacing: 20),
          );
        }
      }),
    );
  }
}
