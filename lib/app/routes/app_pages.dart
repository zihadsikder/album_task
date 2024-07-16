import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/photo/controllers/photo_controller.dart';
import '../modules/photo/views/photo_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO,
      page: () {
        final albumId = int.parse(Get.parameters['albumId']!);
        return PhotoView(albumId: albumId);
      },
      binding: BindingsBuilder(() {
        final albumId = int.parse(Get.parameters['albumId']!);
        Get.lazyPut<PhotoController>(() => PhotoController(albumId));
      }),
    ),
  ];
}
