import 'package:flutter/material.dart';

class EmptyDiscountListWidget extends StatelessWidget {
  const EmptyDiscountListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.discount_outlined,
            size: 40,
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          SizedBox(height: 8.0),
          Text(
            'Não há descontos disponíveis',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
