import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/widgets/list_items.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
          if (controller.newsList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListItems(list: controller.newsList);
          }
        });
  }
}
