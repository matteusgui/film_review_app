import 'package:film_review_app/modules/domain/entity/review_preview.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final int index;
  final ReviewPreview review;
  const CardItem({
    super.key,
    required this.review,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.filmName,
                style: const TextStyle(fontSize: 32),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                review.rating.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                "Watched at: ${review.watchedDate.day}/${review.watchedDate.month}/${review.watchedDate.year}",
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            // TODO: Implement deletion
            debugPrint("Item $index was deleted");
          },
          icon: const Icon(Icons.delete_outline),
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
