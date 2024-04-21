import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardProductSkeleton extends StatelessWidget {
  const CardProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          highlightColor: Theme.of(context).colorScheme.tertiaryContainer,
          baseColor: Theme.of(context).colorScheme.tertiary,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Theme.of(context).colorScheme.tertiary,
                              height: 20,
                              width: double.infinity,
                            ),
                            SizedBox(height: 5),
                            Container(
                              color: Theme.of(context).colorScheme.tertiary,
                              height: 20,
                              width: double.infinity,
                            ),
                            SizedBox(height: 5),
                            Container(
                              color: Theme.of(context).colorScheme.tertiary,
                              height: 20,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  Container(
                    color: Theme.of(context).colorScheme.tertiary,
                    height: 20,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
