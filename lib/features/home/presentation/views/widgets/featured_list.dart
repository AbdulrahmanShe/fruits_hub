import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/home/presentation/views/widgets/featured_item.dart';
import 'package:fruits_hub/generated/l10n.dart';

class FeaturedList extends StatefulWidget {
  const FeaturedList({super.key});

  @override
  State<FeaturedList> createState() => _FeaturedListState();
}

class _FeaturedListState extends State<FeaturedList> {
  static const _autoScrollDuration = Duration(seconds: 4);
  static const _animationDuration = Duration(milliseconds: 600);

  int _currentIndex = 0;

  final List<_AdType> _ads = const [
    _AdType.vegetables,
    _AdType.fruits,
  ];

  @override
  Widget build(BuildContext context) {
    final itemWidth = MediaQuery.sizeOf(context).width - 32;
    final itemHeight = itemWidth * 158 / 342;
    final s = S.of(context);
    final activeIndex = _currentIndex % _ads.length;

    return SizedBox(
      height: itemHeight + 18,
      child: Column(
        children: [
          SizedBox(
            height: itemHeight,
            child: CarouselSlider.builder(
              itemCount: _ads.length,
              options: CarouselOptions(
                height: itemHeight,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: _autoScrollDuration,
                autoPlayAnimationDuration: _animationDuration,
                autoPlayCurve: Curves.easeInOut,
                enableInfiniteScroll: true,
                padEnds: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final type = _ads[index];
                final _FeaturedAd ad = switch (type) {
                  _AdType.vegetables => _FeaturedAd(
                      title: s.vegetableDealsTitle,
                      discount: s.discount30,
                      imageAsset: Assets.imagesVegetable,
                    ),
                  _AdType.fruits => _FeaturedAd(
                      title: s.fruitDealsTitle,
                      discount: s.discount25,
                      imageAsset: Assets.imagesFruits,
                    ),
                };
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FeaturedItem(
                    title: ad.title,
                    discount: ad.discount,
                    imageAsset: ad.imageAsset,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _ads.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                height: 6,
                width: activeIndex == index ? 18 : 6,
                decoration: BoxDecoration(
                  color: activeIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedAd {
  const _FeaturedAd({
    required this.title,
    required this.discount,
    required this.imageAsset,
  });

  final String title;
  final String discount;
  final String imageAsset;
}

enum _AdType {
  vegetables,
  fruits,
}
