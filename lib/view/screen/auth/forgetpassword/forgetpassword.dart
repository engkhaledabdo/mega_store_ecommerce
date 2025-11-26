import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/forgetpassword_controller.dart';

import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttomauth.dart';
import '../../../widget/auth/customtextbody.dart';
import '../../../widget/auth/customtextform.dart';

import '../../../widget/auth/customtexttitle.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // ForgetPasswordCotrollerImp controller =
    //     Get.put(ForgetPasswordCotrollerImp());

    return Scaffold(
        backgroundColor: AppColor.backGround,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backGround,
          elevation: 0,
          title: Text(
            '14'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.gray),
          ),
        ),
        body: GetBuilder<ForgetPasswordCotrollerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Form(
                      key: controller.key,
                      child: ListView(
                        children: [
                          const SizedBox(height: 20),
                          CustomTextTitleAuth(
                            title: '27'.tr,
                          ),
                          const SizedBox(height: 10),
                          CustomTextBodyAuth(text: '24'.tr),
                          const SizedBox(height: 20),
                          CustomTextFormAuth(
                            hintText: '12'.tr,
                            lableText: '18'.tr,
                            iconData: Icons.email_outlined,
                            myController: controller.email,
                            validator: (value) {
                              return validinput(
                                  val: value!, min: 5, max: 100, type: "email");
                            },
                          ),
                          CustomButtonAuth(
                            text: '30'.tr,
                            onPressed: () {
                              controller.checkEmail();
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
