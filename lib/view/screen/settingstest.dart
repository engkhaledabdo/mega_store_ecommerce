// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mega_store/controller/settings_controller.dart';
// import 'package:mega_store/core/constant/approutes.dart';
// import 'package:mega_store/core/constant/colors.dart';
// import 'package:mega_store/core/constant/imageasset.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Settings extends StatelessWidget {
//   const Settings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SettingsControllerImp controller = Get.put(SettingsControllerImp());
//     return Container(
//       child: ListView(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//             alignment: Alignment.center,
//             children: [
//               Container(height: Get.width / 3, color: AppColor.primaryColor),
//               Positioned(
//                 top: Get.width / 4.4,
//                 child: Container(
//                   padding: const EdgeInsets.all(4),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(100)),
//                   child: CircleAvatar(
//                     radius: 40,
//                     backgroundColor: Colors.grey[100],
//                     backgroundImage: const AssetImage(AppImageAsset.logo),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 60,
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // GetBuilder<SettingsControllerImp>(
//                   //   builder: (controller) => ListTile(
//                   //     onTap: () {},
//                   //     title: const Text("Disable Notifications"),
//                   //     trailing: Switch(
//                   //         value: controller.notifications,
//                   //         onChanged: (val) {
//                   //           controller.changeNotifications(val);
//                   //         }),
//                   //   ),
//                   // ),
//                   // Divider(),
//                   ListTile(
//                     onTap: () {
//                       Get.toNamed(AppRoute.addressView);
//                     },
//                     title: const Text("Address"),
//                     trailing: const Icon(Icons.location_on_outlined),
//                   ),
//                   ListTile(
//                     onTap: () {
//                       Get.toNamed(AppRoute.notifications);
//                     },
//                     title: const Text("Notifications"),
//                     trailing: const Icon(Icons.notifications_active_outlined),
//                   ),

//                   ListTile(
//                     onTap: () {},
//                     title: const Text("About us"),
//                     trailing: const Icon(Icons.help_outline_rounded),
//                   ),
//                   // Divider(),
//                   ListTile(
//                     onTap: () async {
//                       await launchUrl(Uri.parse("tel:+201274278784"));
//                     },
//                     title: const Text("Contact us"),
//                     trailing: const Icon(Icons.phone_callback_outlined),
//                   ),
//                   // Divider(),
//                   ListTile(
//                     onTap: () {
//                       controller.logout();
//                     },
//                     title: const Text("Logout"),
//                     trailing: const Icon(Icons.exit_to_app),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
