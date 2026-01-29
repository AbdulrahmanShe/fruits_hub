import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:get/get.dart';

class ProductImageSection extends StatelessWidget {
  const ProductImageSection({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 260,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffF6F6F6),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          child: Center(
            child: product.imageUrl != null
                ? Image.network(product.imageUrl!, height: 160)
                : Image.asset('assets/images/watermelon.png', height: 160),
          ),
        ),

        // زر الرجوع
        Positioned(
          top: 8,
          right: 8,
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
