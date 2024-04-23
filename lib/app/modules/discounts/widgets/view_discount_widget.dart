import 'package:flutter/material.dart';

class ViewDiscountWidget extends StatelessWidget {
  const ViewDiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ver desconto',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(width: 5),
        Image.asset(
          'assets/images/app/see-more.png',
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ],
    );
  }
}
