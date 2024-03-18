import 'package:film_review_app/modules/domain/entity/review_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewDetails extends StatefulWidget {
  final ReviewPreview review;
  const ReviewDetails({super.key, required this.review});

  @override
  State<ReviewDetails> createState() => _ReviewDetailsState();
}

class _ReviewDetailsState extends State<ReviewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
        title: Text(AppLocalizations.of(context)!.reviewDetails),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
      body: const Placeholder(),
    );
  }
}
