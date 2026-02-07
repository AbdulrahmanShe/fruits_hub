import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/views/products_view.dart';
import 'package:fruits_hub/features/home/presentation/views/profile_view.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/home_view.dart';
import 'package:fruits_hub/core/controller/products_controller.dart';
import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = '/mainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;
  final ProductsController controller = Get.find<ProductsController>();
  final List<Widget?> _pages = List.filled(4, null);

  Widget _buildPage(int index) {
    if (_pages[index] == null && index == currentViewIndex) {
      _pages[index] = switch (index) {
        0 => const HomeView(),
        1 => const ProductsView(),
        2 => const CartView(),
        _ => const ProfileView(),
      };
    }
    return _pages[index] ?? const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) { 
          currentViewIndex = index;
          if (index == 0) {
            controller.setView(ProductsListView.featured);
            controller.getFeaturedProducts();
          } else if (index == 1) {
            controller.setView(ProductsListView.all);
            controller.getProducts();
          }
          setState(() {});
         },),
      body: SafeArea(child: IndexedStack(
      index: currentViewIndex,
      children: List.generate(4, _buildPage),
    ),
    ),
    );
  }
}
