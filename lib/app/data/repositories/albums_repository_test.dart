// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:task/app/data/models/album.dart';
// import 'package:task/app/data/models/network_response.dart';
// import 'package:task/app/data/repositories/albums_repository.dart';
// import 'package:task/app/modules/home/controllers/home_controller.dart';
//
// @GenerateMocks([AlbumsRepository])
// void main() {
//   late HomeController homeController;
//   late MockAlbumsRepository mockAlbumsRepository;
//
//   setUp(() {
//     mockAlbumsRepository = MockAlbumsRepository();
//     homeController = HomeController();
//   });
//
//   test('Initial values are correct', () {
//     expect(homeController.isLoading.value, false);
//     expect(homeController.albumsList, []);
//     expect(homeController.searchQuery.value, '');
//   });
//
//   test('Fetching albums successfully updates the album list', () async {
//     final mockAlbums = [Album(id: 1, title: 'Album 1'), Album(id: 2, title: 'Album 2')];
//     when(mockAlbumsRepository.getAlbums(page: 1, pageSize: 10))
//         .thenAnswer((_) async => NetworkResponse.success(jsonResponse: mockAlbums));
//
//     await homeController.getAlbums();
//
//     expect(homeController.albumsList.length, 2);
//     expect(homeController.albumsList.first.title, 'Album 1');
//     expect(homeController.isLoading.value, false);
//   });
//
//   test('Search functionality works correctly', () async {
//     homeController.albumsList.addAll([
//       Album(id: 1, title: 'Album 1'),
//       Album(id: 2, title: 'Album 2'),
//     ]);
//
//     homeController.searchAlbums('1');
//
//     expect(homeController.filteredAlbums.length, 1);
//     expect(homeController.filteredAlbums.first.title, 'Album 1');
//   });
// }
