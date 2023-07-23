import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/view/widgets/category_widget.dart';
import 'package:news_app/view/widgets/home_widget.dart';
import 'package:news_app/view/widgets/settings_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(NewsController());
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(
              AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you want to exit an App'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Get.back(result: false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () => Get.back(result: true),
                    child: const Text('Yes'),
                  ),
                ],
              ),
            ) ??
            false;
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('News App', style: Theme.of(context).textTheme.titleMedium),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  controller.changeThemeMode();
                },
                icon: Icon(controller.iconTheme()))
          ],
        ),
        body: PageView(
          onPageChanged: (index) {
            controller.changeNavBarIndex(currentIndex: index);
          },
          controller: pageController,
          children: const [
            HomeWidget(),
            CategoryWidget(),
            SettingsWidget(),
          ],
        ),
        bottomNavigationBar: GetBuilder<NewsController>(
          builder: (controller) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.index,
              onTap: (index) {
                controller.changeNavBarIndex(currentIndex: index);
                pageController.jumpToPage(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category),
                    label: 'Category',
                    tooltip: 'Category'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                    tooltip: 'Settings'),
              ],
            );
          },
        ),
      ),
    );
  }
}
