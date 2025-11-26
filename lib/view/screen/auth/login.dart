import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/colors.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttomauth.dart';
import '../../widget/auth/customtextbody.dart';
import '../../widget/auth/customtextform.dart';
import '../../widget/auth/customtextsignuporsigin.dart';
import '../../widget/auth/customtexttitle.dart';
import '../../widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backGround,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backGround,
        elevation: 0,
        title: Text(
          '9'.tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.gray),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Form(
                key: controller.key,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    const SizedBox(height: 20),
                    CustomTextTitleAuth(
                      title: '10'.tr,
                    ),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(text: '11'.tr),
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
                    GetBuilder<LoginControllerImp>(
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
                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        '14'.tr,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    CustomButtonAuth(
                      text: '15'.tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextSignUpOrSignIn(
                      textOne: "16".tr,
                      textTwo: "17".tr,
                      onTap: () {
                        controller.goToSignUp();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
