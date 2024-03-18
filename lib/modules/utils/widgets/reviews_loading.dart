import 'package:flutter/material.dart';

/// This class creates a centralized Circular Progress Indicator.
/// 
/// This class is used on the dashboard loading. While waiting for the data fetch.
class ReviewLoading extends StatelessWidget {
  const ReviewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(),
    );
  }
}
