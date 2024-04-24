import 'package:flutter/material.dart';
import 'package:valevantagens/app/utils/extensions/double_extensions.dart';

class DispplayPrecificationWidget extends StatelessWidget {
  final double priceOf;
  final double priceBy;
  final double resultPrecification;

  const DispplayPrecificationWidget({
    super.key,
    required this.priceOf,
    required this.priceBy,
    required this.resultPrecification,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Text("Economize R\$ ${resultPrecification}",
              style: Theme.of(context).textTheme.displaySmall),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              child: Text(priceBy.toReal(),
                  style: Theme.of(context).textTheme.displayLarge),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(width: 5),
            Text(
              priceOf.toReal(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ],
    );
  }
}
