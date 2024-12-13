import 'package:add_to_cart/controllers/recipes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart_page/cart_page.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "products",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(
              () => CartPage(),
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 35,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.red,
                  child: Transform.translate(
                      offset: const Offset(0, -2),
                      child: Obx(
                        () => Text(
                          "${controller.addToCartList.length}",
                          style: const TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: (controller.productsList.isNotEmpty)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                var item = controller.productsList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 190,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(item.image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          item.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$ ${item.price}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Rating :${item.rating.rate}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        IconButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                            Colors.grey,
                          )),
                          onPressed: () =>
                              controller.addToCartProduct(item: item),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.productsList.length,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
