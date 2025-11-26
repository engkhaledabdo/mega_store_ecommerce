import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../../../controller/items_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/transletedb.dart';
import '../../../data/model/categories.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          int selectedCat = index;
          return Categories(
            selectedCat: selectedCat,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  const Categories(
      {super.key, required this.categoriesModel, required this.selectedCat});
  final CategoriesModel categoriesModel;
  final int selectedCat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(
        //   categories: controller.categories,
        //   selectedCat: selectedCat,
        // );
        controller.changeCat(selectedCat, categoriesModel.categoriesId.toString()!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              decoration: controller.selectedCat == selectedCat
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: AppColor.primaryColor)))
                  : null,
              child: Text(
                translateDataBase(categoriesModel.categoriesName!,
                    categoriesModel.categoriesNameAr),
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
