import 'package:equatable/equatable.dart';
import 'package:film_review_app/modules/domain/interfaces/review_complete_interface.dart';

/// This is the complete review.
///
/// This class should be used in the case where a full review should be presented
class Review with EquatableMixin implements CompleteReviewInt {
  @override
  String filmName;

  @override
  int rating;

  @override
  String reviewText;

  @override
  DateTime watchedDate;

  Review(
      {required this.filmName,
      required this.rating,
      required this.reviewText,
      required this.watchedDate});

  @override
  List<Object?> get props => [
        filmName,
        rating,
        reviewText,
        watchedDate,
      ];
}
