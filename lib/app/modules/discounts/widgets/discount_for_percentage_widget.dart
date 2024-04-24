import 'package:flutter/cupertino.dart';
import 'package:valevantagens/app/modules/discounts/widgets/text_field_widget.dart';

class DiscountForPercentageWidget extends StatelessWidget {
  final TextEditingController pricePercentageController;
  final TextEditingController percentageController;
  final FocusNode pricePercentageFocusNode;
  final FocusNode percentageFocusNode;

  const DiscountForPercentageWidget({
    super.key,
    required this.pricePercentageController,
    required this.percentageController,
    required this.pricePercentageFocusNode,
    required this.percentageFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFieldWidget(
          label: 'Preço',
          width: 160,
          numberType: true,
          inputDoubleType: true,
          limitCaracteres: 6,
          controller: pricePercentageController,
          focusNode: pricePercentageFocusNode,
        ),
        TextFieldWidget(
          label: 'Percentual de desconto',
          width: 160,
          numberType: true,
          limitCaracteres: 2,
          controller: percentageController,
          focusNode: percentageFocusNode,
        ),
      ],
    );
  }
}
