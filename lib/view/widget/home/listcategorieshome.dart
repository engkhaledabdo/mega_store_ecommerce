import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../../../controller/homepage_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/transletedb.dart';
import '../../../data/model/categories.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomePageControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
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

class Categories extends GetView<HomePageControllerImp> {
  const Categories(
      {super.key, required this.categoriesModel, required this.selectedCat});
  final CategoriesModel categoriesModel;
  final int selectedCat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            categories: controller.categories,
            selectedCat: selectedCat,
            categoriesId: categoriesModel.categoriesId.toString()!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.thirdColor,
            ),
            height: 60,
            width: 60,
            child: SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
              // ignore: deprecated_member_use
              color: AppColor.secoundColor,
            ),
          ),
          Text(
            translateDataBase(categoriesModel.categoriesName,
                categoriesModel.categoriesNameAr),
            style: const TextStyle(color: Colors.black, fontSize: 13),
          )
        ],
      ),
    );
  }
}
