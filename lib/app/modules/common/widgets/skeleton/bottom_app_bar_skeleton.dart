import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BottomAppBarSkeleton extends StatelessWidget {
  const BottomAppBarSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Shimmer.fromColors(
          highlightColor: Theme.of(context).colorScheme.tertiaryContainer,
          baseColor: Theme.of(context).colorScheme.tertiary,
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
