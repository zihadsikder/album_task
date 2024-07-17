import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/core/config/app_colors.dart';
import 'package:task/app/core/constants/app_text_style.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (controller.hasMoreData) {
          controller.getAlbums(loadMore: false);
        }
      }
    });

    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: searchTextField,
          ),
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value && controller.albumsList.isEmpty) {
                return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ));
              } else if (controller.albumsList.isEmpty) {
                return const Center(child: Text('No albums found'));
              } else {
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: controller.filteredAlbums.length + (controller.hasMoreData ? 1 : 10),
                  itemBuilder: (context, index) {
                    if (index == controller.filteredAlbums.length) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    final album = controller.filteredAlbums[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 16.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade50,
                          child: Text(
                            (index + 1).toString(),
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(8.0),
                        title: Text(
                          album.title ?? 'No Title',
                          style: AppTextStyle.normalStyle(),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.iconColor,
                        ),
                        onTap: () => Get.toNamed(
                          Routes.PHOTO,
                          parameters: {'albumId': album.id.toString()},
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

  TextField get searchTextField {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Search',
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.iconColor,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.clear,
            color: AppColors.iconColor,
          ),
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
    );
  }
}
