import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../photo/views/photo_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    controller.searchQuery.value = '';
                    controller.searchAlbums('');
                  },
                ),
              ),
              onChanged: (query) {
                controller.searchQuery.value = query;
                controller.searchAlbums(query);
              },
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.albumsList.isEmpty) {
                return Center(child: Text('No albums found'));
              } else {
                return ListView.builder(
                  itemCount: controller.filteredAlbums.length,
                  itemBuilder: (context, index) {
                    final album = controller.filteredAlbums[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          title: Text(
                            album.title ?? 'No Title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () => Get.to(() => PhotoView(albumId: album.id!)),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
