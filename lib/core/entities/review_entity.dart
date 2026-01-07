class ReviewEntity {
  final String name;
  final String imageUrl;
  final num rating;
  final DateTime date;
  final String reviewDescription;

  const ReviewEntity({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });
}
