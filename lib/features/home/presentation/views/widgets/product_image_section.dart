import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ 
            CircleAvatar(
              child: SvgPicture.asset(Assets.imagesBackgroundImageProductsDetails),
            ),

          Center(
            child: product.imageUrl != null
                ? Image.network(product.imageUrl!, height: 160)
                : Image.asset('assets/images/watermelon.png', height: 160),
          ),

        // زر الرجوع
        Positioned(
          top: 12,
          right: 12,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: (){
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
              ),
          ),
        ),
      ],
    );
  }
}
