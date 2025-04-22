import 'package:flutter/material.dart';

enum DeviceScreenType { mobile, tablet, desktop }

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceScreenType deviceType)
      builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        DeviceScreenType deviceType;

        if (constraints.maxWidth < 600) {
          deviceType = DeviceScreenType.mobile;
        } else if (constraints.maxWidth < 900) {
          deviceType = DeviceScreenType.tablet;
        } else {
          deviceType = DeviceScreenType.desktop;
        }

        return builder(context, deviceType);
      },
    );
  }
}
