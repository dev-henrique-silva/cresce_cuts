import 'package:flutter/material.dart';
import 'package:valevantagens/app/utils/extensions/double_extensions.dart';

class DisplayPercentagemWidget extends StatelessWidget {
  final double pricePercentage;
  final int percentage;
  final double resultPercentage;
  const DisplayPercentagemWidget({
    super.key,
    required this.pricePercentage,
    required this.percentage,
    required this.resultPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Text("${percentage}% de desconto",
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
              child: Text(resultPercentage.toReal(),
                  style: Theme.of(context).textTheme.displayLarge),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(width: 5),
            Text(
              pricePercentage.toReal(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ],
    );
  }
}
