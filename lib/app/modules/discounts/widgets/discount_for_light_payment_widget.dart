import 'package:flutter/cupertino.dart';
import 'package:valevantagens/app/modules/discounts/widgets/text_field_widget.dart';

class DiscountForLightPaymentWidget extends StatelessWidget {
  final TextEditingController lightController;
  final TextEditingController paymentController;
  final TextEditingController priceLightPaymentController;

  const DiscountForLightPaymentWidget({
    super.key,
    required this.lightController,
    required this.paymentController,
    required this.priceLightPaymentController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldWidget(
              label: 'Leve',
              width: 160,
              controller: lightController,
            ),
            TextFieldWidget(
              label: 'Pague',
              width: 160,
              controller: paymentController,
            ),
          ],
        ),
        TextFieldWidget(
          label: 'Preço',
          controller: priceLightPaymentController,
        ),
      ],
    );
  }
}
