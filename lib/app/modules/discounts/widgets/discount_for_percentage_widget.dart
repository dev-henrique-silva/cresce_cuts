import 'package:flutter/cupertino.dart';
import 'package:valevantagens/app/modules/discounts/widgets/text_field_widget.dart';

class DiscountForPercentageWidget extends StatelessWidget {
  final TextEditingController pricePercentageController;
  final TextEditingController percentageController;

  const DiscountForPercentageWidget({
    super.key,
    required this.pricePercentageController,
    required this.percentageController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFieldWidget(
          label: 'Preço',
          width: 160,
          controller: pricePercentageController,
        ),
        TextFieldWidget(
          label: 'Percentual de desconto',
          width: 160,
          controller: percentageController,
        ),
      ],
    );
  }
}
