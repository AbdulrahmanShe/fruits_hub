import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/favorit_view.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(FavoritView.routeName);
          },
          child: const Text('الانتقال إلى المفضلة'),
        ),
      ),
    );
  }
}