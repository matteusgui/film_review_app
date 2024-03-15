import 'package:equatable/equatable.dart';
import 'package:film_review_app/modules/domain/interfaces/review_complete_interface.dart';

class ReviewDB with EquatableMixin implements CompleteReviewInt {
  @override
  String filmName;

  @override
  int rating;

  @override
  String reviewText;

  @override
  DateTime watchedDate;

  final String id;

  ReviewDB({
    required this.filmName,
    required this.rating,
    required this.reviewText,
    required this.watchedDate,
    required this.id,
  });

  @override
  List<Object?> get props => [filmName, rating, reviewText, watchedDate];

  factory ReviewDB.fromMap(Map<String, dynamic> json) => ReviewDB(
        filmName: json["title"],
        rating: int.parse(json["rating"]),
        reviewText: json["review"],
        watchedDate: DateTime.parse(json["watched"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": filmName,
        "rating": rating,
        "review": reviewText,
        "watched": watchedDate.toIso8601String(),
      };
}
