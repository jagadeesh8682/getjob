import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../bindings/profile_binding.dart';
import '../screens/home/home_view.dart';
import '../screens/profile/profile_view.dart';

abstract class Routes {
  static const HOME = '/home';
  static const PROFILE = '/profile';
}

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
