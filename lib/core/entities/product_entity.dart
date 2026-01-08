import 'package:fruits_hub/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  final String? imageUrl;
  final num expirationMonths;
  final bool isOrganic;
  final num numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final num unitAmount;
  final List<ReviewEntity> reviews;

  const ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
    this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
    this.reviews = const [],
  });

  ProductEntity copyWith({
    String? imageUrl,
  }) {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      isFeatured: isFeatured,
      expirationMonths: expirationMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      imageUrl: imageUrl ?? this.imageUrl,
      avgRating: avgRating,
      ratingCount: ratingCount,
      reviews: reviews,
    );
  }
  
  @override
  List<Object?> get props => [code];
}
