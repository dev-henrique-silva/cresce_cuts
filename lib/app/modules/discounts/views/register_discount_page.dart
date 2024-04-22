import 'package:flutter/material.dart';
import 'package:valevantagens/app/modules/common/widgets/bottom_app_bar_widget.dart';
import 'package:valevantagens/app/modules/common/widgets/custom_scroll_behavior.dart';
import 'package:valevantagens/app/modules/discounts/utils/args/register_discount_args.dart';
import 'package:valevantagens/app/modules/discounts/widgets/discount_for_light_payment_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/discount_for_percentage_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/discount_for_price_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/text_field_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/upload_image_widget.dart';

class RegisterDiscountPage extends StatefulWidget {
  final RegisterDiscountArgs args;

  const RegisterDiscountPage({
    super.key,
    required this.args,
  });

  @override
  State<RegisterDiscountPage> createState() => _RegisterDiscountPageState();
}

class _RegisterDiscountPageState extends State<RegisterDiscountPage> {
  RegisterDiscountArgs get args => widget.args;

// Nome do desconto, descrição, tipo do desconto.
  late TextEditingController discountNameController;
  late TextEditingController descriptionController;
  late TextEditingController discountTypeController;

// Desconto "DE" "POR".
  late TextEditingController ofController;
  late TextEditingController byController;

// Desconto por porcentagem.
  late TextEditingController pricePercentageController;
  late TextEditingController percentageController;

// Desconto pague leve.
  late TextEditingController lightController;
  late TextEditingController paymentController;
  late TextEditingController priceLightPaymentController;

// Data ativação e inativação.
  late TextEditingController dateActivationController;
  late TextEditingController dateInactivationController;

  @override
  void initState() {
    discountNameController = TextEditingController(text: args.title);
    descriptionController = TextEditingController(text: args.description);
    discountTypeController = TextEditingController(text: args.discountType);

    ofController = TextEditingController(text: args.price.toString());
    byController = TextEditingController();

    pricePercentageController =
        TextEditingController(text: args.price.toString());
    percentageController = TextEditingController();

    lightController = TextEditingController();
    paymentController = TextEditingController();
    priceLightPaymentController =
        TextEditingController(text: args.price.toString());

    dateActivationController = TextEditingController();
    dateInactivationController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    discountNameController.dispose();
    descriptionController.dispose();
    discountTypeController.dispose();

    ofController.dispose();
    byController.dispose();

    pricePercentageController.dispose();
    percentageController.dispose();

    lightController.dispose();
    paymentController.dispose();
    priceLightPaymentController.dispose();

    dateActivationController.dispose();
    dateInactivationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0.8,
          shadowColor: Theme.of(context).colorScheme.secondary,
          centerTitle: true,
          title: Text(
            'Cadastro desconto',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFieldWidget(
                  label: 'Nome do desconto',
                  controller: discountNameController,
                ),
                TextFieldWidget(
                  label: 'Descrição',
                  height: 96,
                  controller: descriptionController,
                ),
                TextFieldWidget(
                  label: 'Tipo do desconto',
                  enabled: false,
                  controller: discountTypeController,
                ),
                Visibility(
                  visible: args.discountForPrice,
                  child: DiscountForPriceWidget(
                    ofController: ofController,
                    byController: byController,
                  ),
                ),
                Visibility(
                  visible: args.discountForPercentage,
                  child: DiscountForPercentageWidget(
                    pricePercentageController: pricePercentageController,
                    percentageController: percentageController,
                  ),
                ),
                Visibility(
                  visible: args.discountForLightPayment,
                  child: DiscountForLightPaymentWidget(
                    lightController: lightController,
                    paymentController: paymentController,
                    priceLightPaymentController: priceLightPaymentController,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldWidget(
                      label: 'Data ativação',
                      width: 160,
                      controller: dateActivationController,
                    ),
                    TextFieldWidget(
                      label: 'Data inativação',
                      width: 160,
                      controller: dateInactivationController,
                    ),
                  ],
                ),
                UploadImageWidget(
                  urlImage: args.image ?? '',
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBarWidget(
          title: 'Salvar',
          onPressed: () => {},
        ),
      ),
    );
  }
}
