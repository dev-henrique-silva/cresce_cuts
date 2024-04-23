import 'package:flutter/cupertino.dart';
import 'package:valevantagens/app/modules/discounts/widgets/text_field_widget.dart';

class DiscountForPriceWidget extends StatelessWidget {
  final TextEditingController ofController;
  final TextEditingController byController;

  const DiscountForPriceWidget({
    Key? key,
    required this.ofController,
    required this.byController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextFieldWidget(
          label: 'Preço "De"',
          width: 160,
          inputDoubleType: true,
          controller: ofController,
        ),
        TextFieldWidget(
          label: 'Preço "POR"',
          width: 160,
          inputDoubleType: true,
          controller: byController,
        ),
      ],
    );
  }
}
