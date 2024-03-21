import 'package:film_review_app/modules/domain/entity/review_preview.dart';
import 'package:film_review_app/modules/screens/details.dart';
import 'package:film_review_app/modules/screens/new_review.dart';
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
  late int size = 100;
  bool absorb = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      reviews = callAsyncFetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorb,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.myReviews),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: FutureBuilder<List<ReviewPreview>>(
          future: reviews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ReviewDetails(review: snapshot.data![index]),
                            ),
                          ).then((value) {
                            // TODO
                            // There must be a setState call, that will call the rebuild on the Widget, making that the FutureBuilder reavaliate
                            setState(() {
                              absorb = true;
                              reviews = callAsyncFetch().whenComplete(() {
                                setState(() {
                                  absorb = false;
                                });
                              });
                            });
                          });
                        },
                        child: CardItem(
                          index: index,
                          review: snapshot.data![index],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                        child: Divider(),
                      )
                    ],
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
          onPressed: () async {
            //TODO: Implement change to add Review Page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewReview(),
              ),
            ).then((value) => debugPrint("Nova página"));
          },
          tooltip: AppLocalizations.of(context)!.addReview,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<List<ReviewPreview>> callAsyncFetch() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => List.generate(
        size,
        ((index) => ReviewPreview(
              filmName: "Teste ${size - index}",
              rating: 4,
              watchedDate: DateTime.now(),
            )),
      ),
    ).whenComplete(() => size--);
  }
}


// TODO: Remove this function
