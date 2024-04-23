import 'package:flutter/material.dart';

class DateActivationAndInactivation extends StatelessWidget {
  final String? activationDate;
  final String? inactivationDate;
  final VoidCallback? activationOnTap;
  final VoidCallback? inactivationOnTap;

  const DateActivationAndInactivation({
    super.key,
    this.activationDate,
    this.inactivationDate,
    this.activationOnTap,
    this.inactivationOnTap,
  });

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
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 5.0),
            GestureDetector(
              onTap: activationOnTap,
              child: Container(
                width: 160,
                height: 48,
                child: Center(
                  child: Text('$activationDate'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data inativação',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 5.0),
            GestureDetector(
              onTap: inactivationOnTap,
              child: Container(
                width: 160,
                height: 48,
                child: Center(
                  child: Text('$inactivationDate'),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
