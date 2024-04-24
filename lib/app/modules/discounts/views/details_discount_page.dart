import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valevantagens/app/modules/common/widgets/bottom_app_bar_widget.dart';
import 'package:valevantagens/app/modules/common/widgets/image_view.dart';
import 'package:valevantagens/app/modules/common/widgets/switch_button_widget.dart';
import 'package:valevantagens/app/modules/discounts/controllers/details_discount/details_discount_controller.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/utils/args/register_discount_args.dart';
import 'package:valevantagens/app/modules/discounts/utils/date_activation_inactivation.dart';
import 'package:valevantagens/app/modules/discounts/widgets/bottom_sheet_discount_type_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/displays_discount_widget.dart';

class DetailsDiscountPage extends StatefulWidget {
  final DiscountItemModel args;
  final DetailsDiscountController detailsDiscountController;

  const DetailsDiscountPage({
    super.key,
    required this.args,
    required this.detailsDiscountController,
  });

  @override
  State<DetailsDiscountPage> createState() => _DetailsDiscountPageState();
}

class _DetailsDiscountPageState extends State<DetailsDiscountPage> {
  DiscountItemModel get args => widget.args;
  DetailsDiscountController get detailsDiscountController =>
      widget.detailsDiscountController;

  @override
  void initState() {
    detailsDiscountController.fetchDiscountById(id: args.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.8,
        shadowColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
        title: Text(
          'Detalhes do desconto',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Modular.to.pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Observer(builder: (_) {
                  return SwitchButtonWidget(
                    isActive: detailsDiscountController.discount?.isActive ??
                        args.isActive,
                    onChanged: (isActive) async {
                      if (isActive) {
                        args.dateActivation = DateTime.now();

                        final resultDataInactivation =
                            await pickDateTimeInactivation(
                          context: context,
                          dateTime: args.dateActivation!,
                        );

                        if (resultDataInactivation == null) return;

                        args.dateInactivation = resultDataInactivation;

                        await widget.detailsDiscountController.updateDiscount(
                          discountItem: args.copyWith(
                            isActive: true,
                            dateActivation: args.dateActivation,
                            dateInactivation: args.dateInactivation,
                          ),
                        );
                      } else {
                        args.dateInactivation = DateTime.now();

                        detailsDiscountController.updateDiscount(
                          discountItem: args.copyWith(
                            isActive: false,
                            dateInactivation: args.dateInactivation,
                          ),
                        );
                      }
                    },
                  );
                }),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 355,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                child: Container(
                  child: ImageView(
                    urlImage: args.image,
                  ),
                ),
              ),
              SizedBox(height: 25),
              DisplaysDiscountWidget(
                args: args,
                detailsDiscountController: detailsDiscountController,
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(
        title: 'Editar desconto',
        onPressed: () => {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return BottomSheetDiscountTypeWidget(
                args: RegisterDiscountArgs(
                  title: args.discountName,
                  description: args.description,
                  discountType: args.discountType,
                  price: selectPrice(args.discountType).toString(),
                  priceOf: args.priceOf.toString(),
                  priceBy: args.priceBy.toString(),
                  pricePercentage: args.pricePercentage.toString(),
                  light: args.light.toString(),
                  payment: args.payment.toString(),
                  priceLightPayment: args.priceLightPayment.toString(),
                  dateActivation: args.dateActivation.toString(),
                  dateInactivation: args.dateInactivation.toString(),
                  image: args.image,
                ),
                route: './register_discount',
              );
            },
          ),
        },
      ),
    );
  }

  double? selectPrice(String discountType) {
    if (widget.args.discountType == 'Percentual') {
      return widget.args.pricePercentage;
    } else if (widget.args.discountType == 'Precificação') {
      return widget.args.priceOf;
    } else {
      return widget.args.priceLightPayment;
    }
  }
}
