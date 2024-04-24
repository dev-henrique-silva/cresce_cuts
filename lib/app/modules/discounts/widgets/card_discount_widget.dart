import 'package:flutter/material.dart';
import 'package:valevantagens/app/modules/common/widgets/switch_button_widget.dart';
import 'package:valevantagens/app/modules/discounts/controllers/discounts/discounts_controller.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/utils/date_activation_inactivation.dart';
import 'package:valevantagens/app/modules/discounts/widgets/date_discount_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/details_discount_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/view_discount_widget.dart';
import 'package:valevantagens/app/utils/formatter/formatter.dart';

class CardDiscountWidget extends StatefulWidget {
  final DiscountItemModel discount;
  final DiscountController discountController;

  const CardDiscountWidget({
    super.key,
    required this.discount,
    required this.discountController,
  });

  @override
  State<CardDiscountWidget> createState() => _CardDiscountWidgetState();
}

class _CardDiscountWidgetState extends State<CardDiscountWidget> {
  DiscountItemModel get discount => widget.discount;
  DiscountController get discountController => widget.discountController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Column(
                  children: [
                    DetailsDiscountWidget(
                      urlImage: discount.image,
                      title: discount.discountName,
                      discountType: discount.discountType,
                    ),
                    SizedBox(height: 12),
                    DateDiscountWidget(
                      isActive: discount.isActive,
                      activationDate:
                          Formatter.formatterDate(discount.dateActivation),
                      inactivationDate:
                          Formatter.formatterDate(discount.dateInactivation),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.tertiary,
                thickness: 1,
              ),
              ViewDiscountWidget(),
              SizedBox(height: 5.0)
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SwitchButtonWidget(
                  isActive: discount.isActive,
                  onChanged: (isActive) async {
                    if (isActive) {
                      discount.dateActivation = DateTime.now();

                      final resultDataInactivation =
                          await pickDateTimeInactivation(
                        context: context,
                        dateTime: discount.dateActivation!,
                      );

                      if (resultDataInactivation == null) return;

                      discount.dateInactivation = resultDataInactivation;

                      discountController.updateDiscount(
                        discountItem: discount.copyWith(
                          isActive: true,
                          dateActivation: discount.dateActivation,
                          dateInactivation: discount.dateInactivation,
                        ),
                      );
                    } else {
                      discount.dateInactivation = DateTime.now();

                      discountController.updateDiscount(
                        discountItem: discount.copyWith(
                          isActive: false,
                          dateInactivation: discount.dateInactivation,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
