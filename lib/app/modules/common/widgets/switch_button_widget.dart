import 'package:flutter/material.dart';

class SwitchButtonWidget extends StatelessWidget {
  const SwitchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: true,
      onChanged: (value) {},
      activeTrackColor: Theme.of(context).colorScheme.secondaryContainer,
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
