
import 'package:fruits_hub/core/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String imageUrl;
  final num rating;
  final DateTime date;
  final String reviewDescription;

  const ReviewModel({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });

  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      imageUrl: entity.imageUrl,
      rating: entity.rating,
      date: entity.date,
      reviewDescription: entity.reviewDescription,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      rating: json['rating'] ?? 0,
      date: DateTime.parse(json['date']),
      reviewDescription: json['reviewDescription'] ?? '',
    );
  }
  ReviewEntity toEntity() {
    return ReviewEntity(
        name: name,
        date: date,
        reviewDescription: reviewDescription,
         imageUrl: imageUrl,
          rating: rating);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'rating': rating,
      'date': date.toIso8601String(),
      'reviewDescription': reviewDescription,
    };
  }
}
