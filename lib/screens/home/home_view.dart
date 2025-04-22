import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';
import '../../global_widgets/responsive_builder.dart';
import 'home_mobile_view.dart';
import 'home_web_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, deviceType) {
        switch (deviceType) {
          case DeviceScreenType.desktop:
            return const HomeWebView();
          case DeviceScreenType.tablet:
            return const HomeWebView();
          case DeviceScreenType.mobile:
            return const HomeMobileView();
          default:
            return const HomeMobileView();
        }
      },
    );
  }
}
