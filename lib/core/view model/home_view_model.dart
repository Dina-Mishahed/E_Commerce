import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/service/home_services.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategory();
    getBestSellingProduct();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      //print(value.docs[0].data());
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
        print(value[i].data());
      }
      update();
    });
  }

  getBestSellingProduct() async {
    _loading.value = true;
    HomeService().getProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
        print(value[i].data());
      }
      update();
    });
  }
}
