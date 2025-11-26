import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/success_resetpassword_controller.dart';
import '../../../../core/constant/colors.dart';
import '../../../widget/auth/custombuttomauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordCotrollerImp controller =
        Get.put(SuccessResetPasswordCotrollerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backGround,
        elevation: 0,
        title: Text(
          '32'.tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.gray),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            ),
            Text(
              '37'.tr,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              '38'.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: '31'.tr,
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
