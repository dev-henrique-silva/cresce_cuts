import 'package:flutter/cupertino.dart';
import 'package:valevantagens/app/modules/discounts/widgets/text_field_widget.dart';

class DiscountForLightPaymentWidget extends StatelessWidget {
  final TextEditingController lightController;
  final TextEditingController paymentController;
  final TextEditingController priceLightPaymentController;
  final FocusNode lightFocusNode;
  final FocusNode paymentFocusNode;
  final FocusNode priceLightPaymentFocusNode;

  const DiscountForLightPaymentWidget({
    super.key,
    required this.lightController,
    required this.paymentController,
    required this.priceLightPaymentController,
    required this.lightFocusNode,
    required this.paymentFocusNode,
    required this.priceLightPaymentFocusNode,
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
              numberType: true,
              limitCaracteres: 2,
              controller: lightController,
              focusNode: lightFocusNode,
            ),
            TextFieldWidget(
              label: 'Pague',
              width: 160,
              numberType: true,
              limitCaracteres: 2,
              controller: paymentController,
              focusNode: paymentFocusNode,
            ),
          ],
        ),
        TextFieldWidget(
          label: 'Preço',
          numberType: true,
          inputDoubleType: true,
          limitCaracteres: 6,
          controller: priceLightPaymentController,
          focusNode: priceLightPaymentFocusNode,
        ),
      ],
    );
  }
}
