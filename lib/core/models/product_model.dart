import 'package:fruits_hub/core/entities/product_entity.dart';
import 'package:fruits_hub/core/helper_functions/get_avg_rating.dart';

import 'review_model.dart';

class ProductModel {
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
  final int sellingCount;
  final List<ReviewModel> reviews;
  ProductModel( 
      {required this.name,
      required this.code,
      required this.description,
      required this.expirationMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.reviews,
      required this.price,
      this.sellingCount = 0,
      required this.isOrganic,
      required this.isFeatured,
      this.avgRating = 0, 
      this.ratingCount = 0,
      this.imageUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAvgRating(json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : []),
      name: json['name'],
      code: json['code'],
      description: json['description'],
      expirationMonths: json['expirationMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      sellingCount: json['sellingCount'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
      price: json['price'],
      isOrganic: json['isOrganic'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
    );
  }

ProductEntity toEntity() {
    return ProductEntity(
        name: name,
        code: code,
        description: description,
        price: price,
        reviews: reviews.map((e) => e.toEntity()).toList(),
        expirationMonths: expirationMonths,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
        isOrganic: isOrganic,
        isFeatured: isFeatured,
        imageUrl: imageUrl,
         );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviews.map((e) => e.toJson()).toList()
    };
  }
}