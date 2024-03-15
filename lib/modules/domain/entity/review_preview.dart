import 'package:equatable/equatable.dart';
import 'package:film_review_app/modules/domain/interfaces/review_interface.dart';

/// This class is to be used when fewer information should be presented by the review
class ReviewPreview with EquatableMixin implements ReviewInterface {
  @override
  String filmName;

  @override
  int rating;

  @override
  DateTime watchedDate;

  ReviewPreview({
    required this.filmName,
    required this.rating,
    required this.watchedDate, 
  });

  @override
  List<Object?> get props => [
        filmName,
        rating,
        watchedDate,
      ];
}
