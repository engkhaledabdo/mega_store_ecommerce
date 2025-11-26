import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextbody.dart';
import '../../widget/auth/customtextform.dart';
import '../../widget/auth/customtextsignuporsigin.dart';
import '../../widget/auth/customtexttitle.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => SignUpCotrollerImp());
    return Scaffold(
        backgroundColor: AppColor.backGround,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backGround,
          elevation: 0,
          title: Text(
            '17'.tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.gray),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpCotrollerImp>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest!,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Form(
                  key: controller.key,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(
                        title: '10'.tr,
                      ),
                      const SizedBox(height: 10),
                      CustomTextBodyAuth(text: '24'.tr),
                      const SizedBox(height: 20),
                      CustomTextFormAuth(
                        hintText: '23'.tr,
                        lableText: '20'.tr,
                        iconData: Icons.person_outlined,
                        myController: controller.username,
                        validator: (value) {
                          return validinput(
                              val: value!, min: 5, max: 30, type: "username");
                        },
                      ),
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
                      CustomTextFormAuth(
                        hintText: '22'.tr,
                        lableText: '21'.tr,
                        iconData: Icons.phone_android_outlined,
                        myController: controller.phone,
                        isNumber: true,
                        validator: (value) {
                          return validinput(
                              val: value!, min: 11, max: 11, type: "phone");
                        },
                      ),
                      GetBuilder<SignUpCotrollerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          hintText: '13'.tr,
                          lableText: '19'.tr,
                          iconData: Icons.lock_outline,
                          myController: controller.password,
                          isPassword: controller.isShowPassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                          validator: (value) {
                            return validinput(
                                val: value!, min: 5, max: 30, type: "password");
                          },
                        ),
                      ),
                      CustomButtonAuth(
                        text: '17'.tr,
                        onPressed: () {
                          controller.signUp();
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextSignUpOrSignIn(
                        textOne: "25".tr,
                        textTwo: "26".tr,
                        onTap: () {
                          controller.goToLogin();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
