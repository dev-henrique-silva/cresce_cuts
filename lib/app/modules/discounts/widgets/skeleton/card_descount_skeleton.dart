import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:valevantagens/app/modules/common/widgets/switch_button_widget.dart';

class CardDiscountSkeleton extends StatefulWidget {
  const CardDiscountSkeleton({
    super.key,
  });

  @override
  State<CardDiscountSkeleton> createState() => _CardDiscountSkeletonState();
}

class _CardDiscountSkeletonState extends State<CardDiscountSkeleton> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      itemCount: 10,
      itemBuilder: (context, index) => Shimmer.fromColors(
        highlightColor: Theme.of(context).colorScheme.tertiaryContainer,
        baseColor: Theme.of(context).colorScheme.tertiary,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 16.0,
                      right: 16.0,
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
                                  Padding(
                                    padding: const EdgeInsets.only(right: 50.0),
                                    child: Container(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      height: 15,
                                      width: double.infinity,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: Container(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      height: 15,
                                      width: double.infinity,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    height: 15,
                                    width: double.infinity,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Theme.of(context).colorScheme.tertiary,
                              height: 15,
                              width: 130,
                            ),
                            Container(
                              color: Theme.of(context).colorScheme.tertiary,
                              height: 15,
                              width: 130,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.tertiary,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120.0),
                    child: Container(
                      color: Theme.of(context).colorScheme.tertiary,
                      height: 15,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SwitchButtonWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
