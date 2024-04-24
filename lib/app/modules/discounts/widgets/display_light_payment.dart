import 'package:flutter/material.dart';
import 'package:valevantagens/app/utils/extensions/double_extensions.dart';

class DisplayLightPaymentWidget extends StatelessWidget {
  final int light;
  final int payment;
  final double priceLightPayment;

  const DisplayLightPaymentWidget({
    super.key,
    required this.light,
    required this.payment,
    required this.priceLightPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Text("Leve ${light} Pague ${payment}",
              style: Theme.of(context).textTheme.displaySmall),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Text(priceLightPayment.toReal(),
              style: Theme.of(context).textTheme.displayLarge),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
