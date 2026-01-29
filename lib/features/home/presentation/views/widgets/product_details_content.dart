import 'package:flutter/material.dart';
import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/add_to_cart_section.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/product_properties.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          // الاسم + السعر
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                product.name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
            const Text('1', style: TextStyle(fontSize: 18)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
        ),
               
            ],
          ),

          const SizedBox(height: 8),
          Text(
                '${product.price} ₪ / الكيلو',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

          // التقييم
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 18),
              SizedBox(width: 4),
              Text('${product.avgRating} (${product.ratingCount})'),
            ],
          ),

          const SizedBox(height: 16),

          // الوصف
           Text(
           product.description,
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 24),

          // الخصائص
           ProductProperties(product: product),

          // const Spacer(),
          const SizedBox(height: 24),
          // // زر السلة

          const AddToCartSection(),
          // const SizedBox(height: 24),
        ],
      ),
    );
  }
}
