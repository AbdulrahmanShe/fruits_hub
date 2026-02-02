import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_details_content.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_image_section.dart';
import 'package:get/get.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  static const routeName = '/product_details';

  @override
  Widget build(BuildContext context) {
    final ProductEntity product =
        Get.arguments as ProductEntity;
        
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
             ProductImageSection(product: product),
            Expanded(
                child: ProductDetailsContent(product: product)
                
            ),
          ],
        ),
      ),
    );
  }
}
