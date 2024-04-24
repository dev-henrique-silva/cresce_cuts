import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:valevantagens/app/modules/discounts/controllers/details_discount/details_discount_controller.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/widgets/display_light_payment.dart';
import 'package:valevantagens/app/modules/discounts/widgets/display_percentagem_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/display_precification_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/inactive_campaign_widget.dart';
import 'package:valevantagens/app/utils/enum/discount_type_enum.dart';

class DisplaysDiscountWidget extends StatefulWidget {
  final DiscountItemModel args;
  final DetailsDiscountController detailsDiscountController;

  const DisplaysDiscountWidget({
    super.key,
    required this.args,
    required this.detailsDiscountController,
  });

  @override
  State<DisplaysDiscountWidget> createState() => _DisplaysDiscountWidgetState();
}

class _DisplaysDiscountWidgetState extends State<DisplaysDiscountWidget> {
  DiscountItemModel get args => widget.args;
  DetailsDiscountController get detailsDiscountController =>
      widget.detailsDiscountController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Visibility(
                visible: args.discountType == DiscountsType.precificacao.texto,
                child: DispplayPrecificationWidget(
                  priceOf: args.priceOf ?? 0.0,
                  priceBy: args.priceBy ?? 0.0,
                  resultPrecification: args.resultPrecification ?? 0.0,
                ),
              ),
              Visibility(
                visible: args.discountType == DiscountsType.percentual.texto,
                child: DisplayPercentagemWidget(
                  pricePercentage: args.pricePercentage ?? 0.0,
                  percentage: args.percentage ?? 0,
                  resultPercentage: args.resultPercentage ?? 0.0,
                ),
              ),
              Visibility(
                visible: args.discountType == DiscountsType.levePague.texto,
                child: DisplayLightPaymentWidget(
                  light: args.light ?? 0,
                  payment: args.payment ?? 0,
                  priceLightPayment: args.priceLightPayment ?? 0.0,
                ),
              ),
              Spacer(),
              Observer(builder: (context) {
                return detailsDiscountController.discount?.isActive ??
                        args.isActive
                    ? SizedBox.shrink()
                    : InactiveCampaignWidget();
              }),
            ],
          ),
          SizedBox(height: 8),
          Text(
            args.discountName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 8),
          Text(
            args.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
