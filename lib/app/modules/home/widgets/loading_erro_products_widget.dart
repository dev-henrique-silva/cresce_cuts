import 'package:flutter/material.dart';

class LoadingErroProductsWidget extends StatelessWidget {
  const LoadingErroProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_outlined,
            size: 40,
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          SizedBox(height: 8.0),
          Text(
            'Falha ao carregar produtos',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}
