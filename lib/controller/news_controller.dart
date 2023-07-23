import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/controller/api_helper.dart';
import 'package:news_app/model/news_model.dart';

class NewsController extends GetxController {
  final box = GetStorage();

  void changeThemeMode() {
    String? theme = box.read('theme');
    if (theme == null || theme == 'dark') {
      Get.changeThemeMode(ThemeMode.light);
      box.write('theme', 'light');
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      box.write('theme', 'dark');
    }
    update();
  }

  IconData iconTheme() {
    String? theme = box.read('theme');
    if (theme == 'dark') {
      return Icons.dark_mode;
    } else {
      return Icons.light_mode;
    }
  }

  int index = 0;

  void changeNavBarIndex({required int currentIndex}) {
    index = currentIndex;
    update();
  }

  NewsHelper newsHelper = NewsHelper();
  List<NewsModel> newsList = [];

  void getHeadlines() async {
    newsList = await newsHelper.getHeadlines();
    update();
  }

  @override
  void onInit() {
    getHeadlines();
    super.onInit();
  }
}
