import 'package:get/get.dart';

import '../controllers/photo_controller.dart';

class PhotoBinding extends Bindings {
  final int albumId;

  PhotoBinding(this.albumId);

  @override
  void dependencies() {
    Get.lazyPut<PhotoController>(
      () => PhotoController(albumId),
    );
  }
}
