import 'package:get/get.dart';
import 'package:task/app/data/models/album.dart';
import 'package:task/app/data/repositories/albums_repository.dart';
import '../../../data/models/network_response.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  final albumsList = <Album>[].obs;
  final searchQuery = ''.obs;

  final int pageSize = 10; // Set your page size
  int currentPage = 1;
  bool hasMoreData = true;

  @override
  void onInit() {
    super.onInit();
    getAlbums();
  }

  Future<void> getAlbums({bool loadMore = false}) async {
    if (loadMore) {
      currentPage++;
    } else {
      currentPage = 1;
      albumsList.clear();
      hasMoreData = true;
    }

    if (!hasMoreData) return;

    isLoading.value = true;
    final NetworkResponse response =
    await AlbumsRepository.getAlbums(page: currentPage, pageSize: pageSize);
    if (response.isSuccess) {
      List<Album> newAlbums = albumFromJson(response.jsonResponse!);
      if (newAlbums.length < pageSize) {
        hasMoreData = false;
      }
      albumsList.addAll(newAlbums);
    } else {
      hasMoreData = false; // Stop further requests if the response is not successful
    }
    isLoading.value = false;
  }

  List<Album> get filteredAlbums {
    if (searchQuery.value.isEmpty) {
      return albumsList;
    } else {
      return albumsList
          .where((album) =>
      album.title
          ?.toLowerCase()
          .contains(searchQuery.value.toLowerCase()) ??
          false)
          .toList();
    }
  }

  void searchAlbums(String query) {
    searchQuery.value = query;
    getAlbums();
  }
}
