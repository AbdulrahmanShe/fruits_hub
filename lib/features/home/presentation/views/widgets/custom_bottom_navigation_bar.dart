import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'naivation_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });

  final ValueChanged<int> onItemTapped;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(.12),
            blurRadius: 25,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: Row(
        children: List.generate(
          bottomNavigationBarItems.length,
          (index) {
            final item = bottomNavigationBarItems[index];

            return Expanded(
              flex: index == currentIndex ? 3 : 2,
              child: GestureDetector(
                onTap: () => onItemTapped(index),
                child: NaivgationBarItem(
                  isSelected: index == currentIndex,
                  bottomNavigationBarEntity: item,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
