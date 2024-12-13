import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/recipes_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Your Cart",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Obx(() {
        if (controller.addToCartList.isEmpty) {
          return const Center(
            child: Text(
              "no item in cart!",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.addToCartList.length,
          itemBuilder: (context, index) {
            var item = controller.addToCartList[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(item.image),
                ),
                title: Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Price: \$${item.price}",
                  style: TextStyle(fontSize: 16),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    controller.removeFromCart(item: item);
                  },
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
