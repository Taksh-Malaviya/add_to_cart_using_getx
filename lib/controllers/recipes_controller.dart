import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/recipes_model.dart';

class ProductController extends GetxController {
  RxList<ProductsdataModal> productsList = <ProductsdataModal>[].obs;
  RxList<ProductsdataModal> addToCartList = <ProductsdataModal>[].obs;

  ProductController() {
    loadProductJsonData();
  }

  Future<void> loadProductJsonData() async {
    String assetJsonPath = "assets/json/products.json";

    String productsdata = await rootBundle.loadString(assetJsonPath);

    List allproductsdata = jsonDecode(productsdata);

    productsList.value = allproductsdata
        .map(
          (e) => ProductsdataModal.fromJson(json: e),
        )
        .toList();
  }

  void removeFromCart({required ProductsdataModal item}) {
    addToCartList.remove(item);
  }

  void addToCartProduct({required ProductsdataModal item}) {
    addToCartList.add(item);

    log("Cart List Length : ${addToCartList.length}");

    Get.back();
  }
}
