import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homepage_controller.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

class ListItemsSearch extends GetView<HomePageControllerImp> {
  const ListItemsSearch({super.key, required this.listdatamodel});
  final List<ItemsModel> listdatamodel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listdatamodel.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageItemsDetails(listdatamodel[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Expanded(
                      child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${listdatamodel[index].itemsImage}",
                  )),
                  Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(listdatamodel[index].itemsName!),
                        subtitle: Text(listdatamodel[index].categoriesName!),
                      )),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
