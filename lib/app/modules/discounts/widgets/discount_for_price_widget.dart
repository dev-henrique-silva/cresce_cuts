import 'package:flutter/cupertino.dart';
import 'package:valevantagens/app/modules/discounts/widgets/text_field_widget.dart';

class DiscountForPriceWidget extends StatelessWidget {
  final TextEditingController ofController;
  final TextEditingController byController;
  final FocusNode ofFocusNode;
  final FocusNode byFocusNode;

  const DiscountForPriceWidget({
    Key? key,
    required this.ofController,
    required this.byController,
    required this.ofFocusNode,
    required this.byFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFieldWidget(
          label: 'Preço "De"',
          width: 160,
          numberType: true,
          inputDoubleType: true,
          limitCaracteres: 6,
          controller: ofController,
          focusNode: ofFocusNode,
        ),
        TextFieldWidget(
          label: 'Preço "POR"',
          width: 160,
          numberType: true,
          inputDoubleType: true,
          limitCaracteres: 6,
          controller: byController,
          focusNode: byFocusNode,
        ),
      ],
    );
  }
}
