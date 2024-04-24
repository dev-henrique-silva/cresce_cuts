import 'package:flutter/material.dart';

class SwitchButtonWidget extends StatelessWidget {
  final bool isActive;
  final Function(bool)? onChanged;

  const SwitchButtonWidget({
    super.key,
    this.isActive = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: isActive,
      onChanged: onChanged,
      activeTrackColor: Theme.of(context).colorScheme.secondaryContainer,
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
