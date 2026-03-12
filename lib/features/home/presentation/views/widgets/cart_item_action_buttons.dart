import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/domain/entites/car_item_entity.dart';
import 'package:get/get.dart';

class CartItemActionButtons extends StatelessWidget {
    const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Obx((){
      return Row(
        children: [
          CartItemActionButton(
            iconColor: Colors.white,
            icon: Icons.add,
            color: colors.primary,
            onPressed: () => cartItemEntity.increaseQuantity(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              // '12',
              cartItemEntity.quantity.value.toString(),
              textAlign: TextAlign.center,
              style: TextStyles.bold16.copyWith(
                color: colors.onSurface,
              ),
            ),
          ),
          CartItemActionButton(
            iconColor: colors.onSurface.withValues(alpha: 0.7),
            icon: Icons.remove,
            color: colors.surface,
            onPressed: () => cartItemEntity.decreasQuantity(),
          )
        ],
      );
    }
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.onPressed,
      required this.iconColor});

  final IconData icon;
  final Color iconColor;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(
          2,
        ),
        decoration: ShapeDecoration(
          color: color,
          shadows: [
            BoxShadow(
              color: theme.shadowColor.withValues(alpha: 0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
