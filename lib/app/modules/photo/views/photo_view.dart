import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../controllers/photo_controller.dart';

class PhotoView extends GetView<PhotoController> {
  PhotoView({super.key, required this.albumId});

  final int albumId;

  @override
  Widget build(BuildContext context) {
    final PhotoController controller = Get.put(PhotoController(albumId));

    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        leading: BackButton(),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.photosList.isEmpty) {
          return Center(child: Text('No photos found'));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: controller.photosList.length,
            itemBuilder: (context, index) {
              final photo = controller.photosList[index];
              return GridTile(
                child: CachedNetworkImage(
                  imageUrl: photo.thumbnailUrl ?? '',
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(photo.title ?? 'No Title'),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
