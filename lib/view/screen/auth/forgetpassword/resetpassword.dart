import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttomauth.dart';
import '../../../widget/auth/customtextbody.dart';

import '../../../widget/auth/customtextform.dart';
import '../../../widget/auth/customtexttitle.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordCotrollerImp());
    return Scaffold(
        backgroundColor: AppColor.backGround,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backGround,
          elevation: 0,
          title: Text(
            'Reset Password',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.gray),
          ),
        ),
        body: GetBuilder<ResetPasswordCotrollerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Form(
                key: controller.key,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const CustomTextTitleAuth(
                      title: 'New Password',
                    ),
                    const SizedBox(height: 10),
                    const CustomTextBodyAuth(text: 'Please Enter New Password'),
                    const SizedBox(height: 20),
                    CustomTextFormAuth(
                      hintText: 'Enter Your Password',
                      lableText: 'Password',
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
                    CustomTextFormAuth(
                      hintText: 'Enter Your rePassword',
                      lableText: 'rePassword',
                      iconData: Icons.lock_outline,
                      myController: controller.repassword,
                      isPassword: controller.isShowRePassword,
                      onTapIcon: () {
                        controller.showRePassword();
                      },
                      validator: (value) {
                        return validinput(
                            val: value!, min: 5, max: 30, type: "password");
                      },
                    ),
                    CustomButtonAuth(
                      text: 'Save',
                      onPressed: () {
                        controller.resetPassword();
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
