import 'package:flutter/material.dart';
import 'package:valevantagens/app/modules/discounts/widgets/inactive_campaign_widget.dart';

class DateDiscountWidget extends StatelessWidget {
  final String activationDate;
  final String inactivationDate;
  final bool isActive;

  const DateDiscountWidget({
    super.key,
    required this.activationDate,
    required this.inactivationDate,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        !isActive
            ? InactiveCampaignWidget()
            : Column(
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
