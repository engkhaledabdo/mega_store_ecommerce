import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/onBoardingController.dart';
import '../../core/constant/colors.dart';
import '../widget/onboarding/slidercontroller.dart';
import '../widget/onboarding/onboardingButton.dart';
import '../widget/onboarding/dotconttroler.dart';

class ObBoarding extends StatelessWidget {
  const ObBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoradingControllerImp());
    return const Scaffold(
      backgroundColor: AppColor.backGround,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(flex: 4, child: CustomSliderOnBoarding()),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    OnboardingButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
