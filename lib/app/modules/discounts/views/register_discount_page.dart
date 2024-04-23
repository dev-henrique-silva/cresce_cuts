import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:valevantagens/app/modules/common/widgets/bottom_app_bar_widget.dart';
import 'package:valevantagens/app/modules/common/widgets/custom_scroll_behavior.dart';
import 'package:valevantagens/app/modules/discounts/controllers/register_discount/register_discount_controller.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/utils/args/register_discount_args.dart';
import 'package:valevantagens/app/modules/discounts/widgets/date_activation_and_inactivation.dart';
import 'package:valevantagens/app/modules/discounts/widgets/discount_for_light_payment_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/discount_for_percentage_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/discount_for_price_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/flushbar_error_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/text_field_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/upload_image_widget.dart';
import 'package:valevantagens/app/utils/extensions/double_extensions.dart';
import 'package:valevantagens/app/utils/formatter/formatter.dart';

class RegisterDiscountPage extends StatefulWidget {
  final RegisterDiscountArgs? args;
  final RegisterDiscountController registerDiscountController;

  const RegisterDiscountPage({
    super.key,
    required this.args,
    required this.registerDiscountController,
  });

  @override
  State<RegisterDiscountPage> createState() => _RegisterDiscountPageState();
}

class _RegisterDiscountPageState extends State<RegisterDiscountPage> {
  RegisterDiscountArgs get args => widget.args ?? RegisterDiscountArgs();
  RegisterDiscountController get registerDiscountController =>
      widget.registerDiscountController;

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

  @override
  void initState() {
    discountNameController = TextEditingController(text: args.title);
    descriptionController = TextEditingController(text: args.description);
    discountTypeController = TextEditingController(text: args.discountType);

    ofController = TextEditingController(text: args.price);
    byController = TextEditingController();

    pricePercentageController = TextEditingController(text: args.price);
    percentageController = TextEditingController();

    lightController = TextEditingController();
    paymentController = TextEditingController();
    priceLightPaymentController = TextEditingController(text: args.price);

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.0),
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
                Observer(
                  builder: (_) {
                    return DateActivationAndInactivation(
                      activationDate: Formatter.formatterDate(
                          registerDiscountController.activationDate),
                      inactivationDate: Formatter.formatterDate(
                          registerDiscountController.inactivationDate),
                      activationOnTap: () async {
                        await pickDateTimeActivation();
                        validatePickActiveDate();
                      },
                      inactivationOnTap: () async {
                        await pickDateTimeInactivation();
                      },
                    );
                  },
                ),
                SizedBox(height: 15.0),
                Observer(
                  builder: (_) {
                    return UploadImageWidget(
                      urlImage: args.image ?? '',
                      fileImage: registerDiscountController.imageFile ?? null,
                      onTap: () => registerDiscountController.getImageGallery(),
                    );
                  },
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBarWidget(
          title: 'Salvar',
          onPressed: () => {
            registerDiscountController.insertDiscount(
                discountItem: DiscountItemModel(
              discountName: discountNameController.text,
              description: descriptionController.text,
              discountType: discountTypeController.text,
              priceOf: Formatter.toCurrecyDolar(ofController.text),
              priceBy: Formatter.toCurrecyDolar(byController.text),
              percentage: percentageController.text,
              pricePercentage:
                  Formatter.toCurrecyDolar(pricePercentageController.text),
              light: Formatter.toCurrecyDolar(lightController.text),
              payment: Formatter.toCurrecyDolar(paymentController.text),
              priceLightPayment:
                  Formatter.toCurrecyDolar(priceLightPaymentController.text),
              dateActivation: registerDiscountController.activationDate,
              dateInactivation: registerDiscountController.inactivationDate,
              image: args.image!,
            )),
          },
        ),
      ),
    );
  }

  Future pickDateTimeActivation() async {
    final date = await pickDate(activation: true);
    if (date == null) return;
    final timeOfDay = await pickTime();
    if (timeOfDay == null) return;

    registerDiscountController.activationDate = DateTime(
      date.year,
      date.month,
      date.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
  }

  Future pickDateTimeInactivation() async {
    if (!validatePickInactiveDate()) return;
    final date = await pickDate(
      activation: false,
      dateTime: registerDiscountController.activationDate,
    );
    if (date == null) return;
    final timeOfDay = await pickTime();
    if (timeOfDay == null) return;

    registerDiscountController.inactivationDate = DateTime(
      date.year,
      date.month,
      date.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
  }

  void validatePickActiveDate() {
    final activationDate = registerDiscountController.activationDate;
    final inactivationDate = registerDiscountController.inactivationDate;

    if (inactivationDate != null &&
        inactivationDate.isBefore(activationDate!)) {
      registerDiscountController.inactivationDate =
          activationDate.scheduleDateOneDayLater();
    }
  }

  bool validatePickInactiveDate() {
    if (registerDiscountController.activationDate == null) {
      FlushbarErrorWidget(
        context: context,
        title: 'Data de ativação não informada',
        message: 'Por favor, informe a data de ativação',
      );
      return false;
    }
    return true;
  }

  Future<DateTime?> pickDate({required bool activation, DateTime? dateTime}) {
    return showDatePicker(
      context: context,
      initialDate:
          activation ? DateTime.now() : dateTime!.scheduleDateOneDayLater(),
      firstDate:
          activation ? DateTime.now() : dateTime!.scheduleDateOneDayLater(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.secondary,
              onPrimary: Theme.of(context).colorScheme.primary,
              surface: Theme.of(context).colorScheme.tertiary,
              onSurface: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  Future<TimeOfDay?> pickTime() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.secondary,
              onPrimary: Theme.of(context).colorScheme.primary,
              surface: Theme.of(context).colorScheme.primary,
              onSurface: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
