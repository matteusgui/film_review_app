import 'package:film_review_app/modules/domain/entity/review_preview.dart';
import 'package:film_review_app/modules/utils/widgets/card_item.dart';
import 'package:film_review_app/modules/utils/widgets/reviews_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// This page controls if a Loading page is to be shown or if a ListView Page should be shown

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late Future<List<ReviewPreview>> reviews;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("Carregando dados.");
    reviews = callAsyncFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.myReviews),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<ReviewPreview>>(
        future: reviews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CardItem(
                  index: index,
                  review: snapshot.data![index],
                );
              },
            );
          } else {
            // In this case the
            return const ReviewLoading();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: Implement change to add Review Page
        },
        tooltip: AppLocalizations.of(context)!.addReview,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// TODO: Remove this function
Future<List<ReviewPreview>> callAsyncFetch() => Future.delayed(
    const Duration(seconds: 2),
    () => List.generate(
        100,
        ((index) => ReviewPreview(
            filmName: "Teste $index",
            rating: 4,
            watchedDate: DateTime.now()))));
