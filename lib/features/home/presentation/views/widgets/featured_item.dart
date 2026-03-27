import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item_button.dart';
import 'package:fruits_hub/generated/l10n.dart';
import 'package:svg_flutter/svg.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    super.key,
    required this.title,
    required this.discount,
    required this.imageAsset,
  });

  final String title;
  final String discount;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 32;
    final theme = Theme.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Material(
      color: theme.cardColor,
      elevation: theme.brightness == Brightness.dark ? 0.5 : 1,
      borderRadius: BorderRadius.circular(8),
      shadowColor: theme.shadowColor.withValues(alpha: 0.15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: itemWidth,
          child: AspectRatio(
            aspectRatio: 342 / 158,
            child: Stack(
              children: [
                Positioned.fill(
                  child: _buildImage(),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: isRtl
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        end: isRtl
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.55),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 18,
                      end: 80,
                      top: 12,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _DiscountBadge(text: discount),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.start,
                              style: TextStyles.bold19.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              S.of(context).limitedTime,
                              textAlign: TextAlign.start,
                              style: TextStyles.regular13.copyWith(
                                color: Colors.white.withValues(alpha: 0.9),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: FeaturedItemButton(
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    final lower = imageAsset.toLowerCase();
    if (lower.endsWith('.png') ||
        lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg')) {
      return Image.asset(
        imageAsset,
        fit: BoxFit.cover,
      );
    }
    return SvgPicture.asset(
      imageAsset,
      fit: BoxFit.cover,
    );
  }
}

class _DiscountBadge extends StatelessWidget {
  const _DiscountBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyles.regular13.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
