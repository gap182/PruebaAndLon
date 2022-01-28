import 'package:get/route_manager.dart';
import 'package:prueba_and_lond/home/home_binding.dart';
import 'package:prueba_and_lond/home/home_page.dart';
import 'package:prueba_and_lond/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    )
  ];
}
