import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/settings_controller.dart';

import '../../core/class/handlingdataview.dart';
import '../../core/constant/approutes.dart';
import '../../core/constant/imageasset.dart';
import '../widget/customappbar.dart';
import '../widget/search/search.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImp());
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<SettingsControllerImp>(
            builder: (controller) => Column(
              children: [
                CustomAppBar(
                  titleAppBar: "39".tr,
                  onPressedSearch: () {
                    controller.onSearchItems();
                  },
                  onPressedFavorite: () {
                    Get.toNamed(AppRoute.myFavotite);
                  },
                  mycontroller: controller.search!,
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                ),
                Expanded(
                  child: ListView(
                    children: [
                      !controller.isSearch
                          ? ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.data.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        // to do
                                      },
                                      child: Card(
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 10,
                                                  left: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: CircleAvatar(
                                                radius: 40,
                                                backgroundColor:
                                                    Colors.grey[100],
                                                backgroundImage:
                                                    const AssetImage(
                                                        AppImageAsset.logo),
                                              ),
                                            ),
                                            Expanded(
                                              child: ListTile(
                                                title: Text(
                                                    "${controller.username}"),
                                                subtitle:
                                                    Text("${controller.email}"),
                                                trailing: const Icon(
                                                    Icons.arrow_forward_ios),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Container(
                                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Card(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            Get.toNamed(AppRoute.addressView);
                                          },
                                          title: const Text("Address"),
                                          trailing: const Icon(
                                              Icons.location_on_outlined),
                                        ),
                                        ListTile(
                                          onTap: () {
                                            Get.toNamed(AppRoute.notifications);
                                          },
                                          title: const Text("Notifications"),
                                          trailing: const Icon(Icons
                                              .notifications_active_outlined),
                                        ),

                                        ListTile(
                                          onTap: () {},
                                          title: const Text("About us"),
                                          trailing: const Icon(
                                              Icons.help_outline_rounded),
                                        ),
                                        // Divider(),
                                        ListTile(
                                          onTap: () async {
                                            await launchUrl(
                                                Uri.parse("tel:+201274278784"));
                                          },
                                          title: const Text("Contact us"),
                                          trailing: const Icon(
                                              Icons.phone_callback_outlined),
                                        ),
                                        // Divider(),
                                        ListTile(
                                          onTap: () {
                                            controller.logout();
                                          },
                                          title: const Text("Logout"),
                                          trailing:
                                              const Icon(Icons.exit_to_app),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : ListItemsSearch(listdatamodel: controller.listdata),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
