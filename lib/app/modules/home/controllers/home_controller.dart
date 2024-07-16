import 'package:get/get.dart';
import 'package:task/app/data/models/album.dart';
import 'package:task/app/data/repositories/albums_repository.dart';

import '../../../data/models/network_response.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final albumsList = <Album>[].obs;
  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getAlbums();
  }

  Future<void> getAlbums() async {
    isLoading.value = true;
    final NetworkResponse response = await AlbumsRepository.getAlbums();
    if (response.isSuccess) {
      albumsList.value = albumFromJson(response.jsonResponse!);
    }
    isLoading.value = false;
  }

  List<Album> get filteredAlbums {
    if (searchQuery.value.isEmpty) {
      return albumsList;
    } else {
      return albumsList.where((album) =>
      album.title?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false
      ).toList();
    }
  }

  void searchAlbums(String query) {
    searchQuery.value = query;
  }
}
