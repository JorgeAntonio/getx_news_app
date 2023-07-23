import 'package:flutter/material.dart';
import 'package:news_app/shared/constant.dart';
import 'package:news_app/view/widgets/list_items.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  late TabController? controller;

  @override
  void initState() {
    controller =
        TabController(length: CategoryList.categoryItems.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          controller: controller,
          tabs: controller!.animation!.value
                  .round() // to get the current index of the tab
                  .isEven // to check if the current index is even or odd
              ? CategoryList.categoryItems
                  .map(
                    (e) => Tab(
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  )
                  .toList()
              : CategoryList.categoryItems
                  .map(
                    (e) => Tab(
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  )
                  .toList()
                  .reversed
                  .toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: CategoryList.categoryItems
                .map((e) => const ListItems(
                      list: [],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
