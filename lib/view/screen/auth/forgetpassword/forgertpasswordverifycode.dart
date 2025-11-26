import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/forgetpasswordverifycode_controller.dart';
import '../../../../core/class/handlingdataview.dart';

import '../../../../core/constant/colors.dart';

import '../../../widget/auth/customtextbody.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../../widget/auth/customtexttitle.dart';

class ForgetPasswordVerifyCode extends StatelessWidget {
  const ForgetPasswordVerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordVerifyCodeCotrollerImp());
    return Scaffold(
        backgroundColor: AppColor.backGround,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backGround,
          elevation: 0,
          title: Text(
            'Verification Code',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.gray),
          ),
        ),
        body: GetBuilder<ForgetPasswordVerifyCodeCotrollerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  const CustomTextTitleAuth(
                    title: 'Check code',
                  ),
                  const SizedBox(height: 10),
                  CustomTextBodyAuth(
                      text:
                          "Please Enter The Digit Code Sent To ${Get.arguments['email']}"),
                  const SizedBox(height: 20),
                  OtpTextField(
                    focusedBorderColor: AppColor.primaryColor,
                    fieldWidth: 50.0,
                    borderRadius: BorderRadius.circular(10),
                    numberOfFields: 5,
                    borderColor: AppColor.primaryColor,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToResetPassword(
                          verificationCode: verificationCode);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
