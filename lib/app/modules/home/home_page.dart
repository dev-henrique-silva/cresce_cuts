import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0.8,
          shadowColor: Theme.of(context).colorScheme.secondary,
          centerTitle: true,
          title: Text(
            'Vale Vantagens',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Center(
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ));
  }
}
