import 'package:flutter/material.dart';

class AddToCartSection extends StatelessWidget {
  const AddToCartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'أضف إلى السلة',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
