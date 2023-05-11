import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view%20model/control_view_model.dart';
import 'package:e_commerce/core/view%20model/home_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/details_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/constance.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      _searchTextFormField(),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: "Categories",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _listViewCategory(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomText(
                            text: "Best Selling",
                            fontsize: 18,
                          ),
                          CustomText(
                            text: "See all",
                            fontsize: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewProduct(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: 100,
              child: ListView.separated(
                  itemCount: controller.categoryModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100,
                        ),
                        height: 60,
                        width: 60,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(controller
                                .categoryModel[index].image
                                .toString())),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                          text:
                              controller.categoryModel[index].name.toString()),
                    ]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      )),
            ),
    );
  }

  Widget _listViewProduct() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
          height: 300,
          child: ListView.separated(
              itemCount: controller.productModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(DetailsView( controller.productModel[index]));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].image as String,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: controller.productModel[index].name as String,
                          alignment: Alignment.bottomLeft,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: controller.productModel[index].description
                              as String,
                          color: Colors.grey,
                          alignment: Alignment.bottomLeft,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: controller.productModel[index].price as String,
                          color: primaryColor,
                          alignment: Alignment.bottomLeft,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ))),
    );
  }
}
