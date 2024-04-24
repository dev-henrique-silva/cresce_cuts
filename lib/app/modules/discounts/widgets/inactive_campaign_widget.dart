import 'package:flutter/material.dart';

class InactiveCampaignWidget extends StatelessWidget {
  const InactiveCampaignWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.error,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          'Campanha inativa',
          style: TextStyle(
            color: Theme.of(context).colorScheme.error,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
