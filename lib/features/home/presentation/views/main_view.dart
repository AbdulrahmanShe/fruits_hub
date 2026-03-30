import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/products_view.dart';
import 'package:fruits_hub/features/home/presentation/views/profile_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:fruits_hub/features/home/presentation/controller/main_controller.dart';
import 'package:fruits_hub/features/home/presentation/controller/profile_controller.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = '/mainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final ProductsController controller = Get.find<ProductsController>();
  final MainController mainController = Get.find<MainController>();
  final ProfileController profileController = Get.find<ProfileController>();

  final List<Widget> pages = const [
    HomeView(),
    ProductsView(),
    CartView(),
    ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    profileController.loadFromLocal();
  }

  void _handleTabChange(int index) {
    mainController.setIndex(index);

    switch (index) {
      case 0:
        controller.clearSearch();
        controller.setView(ProductsListView.featured);
        controller.getFeaturedProducts();
        break;

      case 1:
        controller.setView(ProductsListView.all);
        controller.getProducts();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final currentIndex = mainController.currentIndex.value;
      return Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: currentIndex,
          onItemTapped: _handleTabChange,
        ),
        body: SafeArea(
          child: IndexedStack(
            index: currentIndex,
            children: pages,
          ),
        ),
      );
    });
  }
}
