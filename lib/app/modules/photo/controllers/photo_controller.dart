import 'package:get/get.dart';
import '../../../data/models/network_response.dart';
import '../../../data/models/photo.dart';
import '../../../data/repositories/albums_repository.dart';

class PhotoController extends GetxController {
  final int albumId;

  PhotoController(this.albumId);

  @override
  void dependencies() {
    Get.lazyPut<PhotoController>(() => PhotoController(albumId));
  }

  final isLoading = false.obs;
  final photosList = <Photo>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPhotos();
  }

  Future<void> getPhotos() async {
    isLoading.value = true;
    final NetworkResponse response = await AlbumsRepository.getPhotos(albumId);
    if (response.isSuccess) {
      photosList.value = photoFromJson(response.jsonResponse!);
    }
    isLoading.value = false;
  }
}
