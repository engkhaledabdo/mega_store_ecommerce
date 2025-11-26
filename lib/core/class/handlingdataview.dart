import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';


import '../constant/imageasset.dart';
import 'statusRequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(AppImageAsset.offline, width: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(AppImageAsset.serverFaliuer, width: 350))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.noData, width: 300))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImageAsset.loading))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(AppImageAsset.offline, width: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(AppImageAsset.serverFaliuer, width: 350))
                : statusRequest == StatusRequest.serverException
                    ? Center(
                        child: Lottie.asset(AppImageAsset.serverFaliuer,
                            width: 350))
                    : widget;
  }
}
