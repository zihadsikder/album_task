import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:task/app/core/constants/app_text_style.dart';

import '../../../core/config/app_colors.dart';
import '../controllers/photo_controller.dart';

class PhotoView extends GetView<PhotoController> {
  const PhotoView({super.key, required this.albumId});

  final int albumId;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        title: const Text('Photos'),
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor));
            } else if (controller.filteredPhotosList.isEmpty) {
              return const Center(child: Text('No photos found'));
            } else {
              return LayoutBuilder(builder: (context, constraints) {
                int crossAxisCount = screenWidth > 600 ? 4 : 2;
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemCount: controller.filteredPhotosList.length,
                  itemBuilder: (context, index) {
                    final photo = controller.filteredPhotosList[index];
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: photo.thumbnailUrl ?? '',
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.primaryColor)),
                              errorWidget: (context, url, error) => Center(
                                  child: Icon(Icons.error,
                                      color: AppColors.iconColor)),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              photo.title ?? 'No Title',
                              style: AppTextStyle.normalStyle(fontSize: 14),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              });
            }
          }),
        ),
      ),
    );
  }
}
