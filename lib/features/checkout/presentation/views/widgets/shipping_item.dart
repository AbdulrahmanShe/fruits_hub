import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/generated/l10n.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.isSelected,
      required this.onTap});
  final String title, subTitle, price;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.only(
          top: 16,
          left: 13,
          right: 28,
          bottom: 16,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: colors.surface,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? colors.primary : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected
                  ? const ActiveShippingItemDot()
                  : const InActiveShippingItemDot(),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.semiBold13.copyWith(color: colors.onSurface),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13
                        .copyWith(color: colors.onSurface.withValues(alpha: 0.6)),
                  )
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  S.of(context).ilsAmount(price),
                  style: TextStyles.bold13.copyWith(
                    color: colors.primary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(width: 1, color: colors.outline.withValues(alpha: 0.6)),
        ),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        color: colors.primary,
        shape: OvalBorder(
          side: BorderSide(width: 4, color: colors.surface),
        ),
      ),
    );
  }
}
