
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/profile_controller.dart';
import '../../global_widgets/responsive_builder.dart';
import 'profile_mobile_view.dart';
import 'profile_web_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, deviceType) {
        switch (deviceType) {
          case DeviceScreenType.desktop:
            return const ProfileWebView();
          case DeviceScreenType.tablet:
            return const ProfileWebView();
          case DeviceScreenType.mobile:
            return const ProfileMobileView();
          default:
            return const ProfileMobileView();
        }
      },
    );
  }
}