import 'package:flutter/material.dart';

class DateDiscountWidget extends StatelessWidget {
  final String activationDate;
  final String inactivationDate;

  const DateDiscountWidget(
      {super.key,
      required this.activationDate,
      required this.inactivationDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data ativação',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              activationDate,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data inativação',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              inactivationDate,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
