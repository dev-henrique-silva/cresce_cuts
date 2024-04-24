import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valevantagens/app/modules/common/widgets/bottom_app_bar_widget.dart';
import 'package:valevantagens/app/modules/common/widgets/custom_scroll_behavior.dart';
import 'package:valevantagens/app/modules/discounts/controllers/register_discount/register_discount_controller.dart';
import 'package:valevantagens/app/modules/discounts/utils/args/discount_args.dart';
import 'package:valevantagens/app/modules/discounts/utils/args/register_discount_args.dart';
import 'package:valevantagens/app/modules/discounts/utils/date_activation_inactivation.dart';
import 'package:valevantagens/app/modules/discounts/widgets/date_activation_and_inactivation.dart';
import 'package:valevantagens/app/modules/discounts/widgets/discount_for_light_payment_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/discount_for_percentage_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/discount_for_price_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/flushbar_error_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/text_field_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/upload_image_widget.dart';
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

// FocusNode
  FocusNode discountNamefocusNode = FocusNode();
  FocusNode descriptionfocusNode = FocusNode();
  FocusNode discountTypefocusNode = FocusNode();

  FocusNode ofFocusNode = FocusNode();
  FocusNode byFocusNode = FocusNode();

  FocusNode pricePercentageFocusNode = FocusNode();
  FocusNode percentageFocusNode = FocusNode();

  FocusNode lightFocusNode = FocusNode();
  FocusNode paymentFocusNode = FocusNode();
  FocusNode priceLightPaymentFocusNode = FocusNode();

  @override
  void initState() {
    discountNameController = TextEditingController(text: args.title);
    descriptionController = TextEditingController(text: args.description);
    discountTypeController = TextEditingController(text: args.discountType);

    ofController = TextEditingController(text: args.priceOf);
    byController = TextEditingController(text: args.priceBy);

    pricePercentageController =
        TextEditingController(text: args.pricePercentage);
    percentageController = TextEditingController(text: args.percentage);

    lightController = TextEditingController(text: args.light);
    paymentController = TextEditingController(text: args.payment);
    priceLightPaymentController =
        TextEditingController(text: args.priceLightPayment);

    registerDiscountController.setActivationInactivationDate(
      activation: args.dateActivation,
      inactivation: args.dateInactivation,
    );

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

    discountNamefocusNode.dispose();
    descriptionfocusNode.dispose();
    discountTypefocusNode.dispose();

    ofFocusNode.dispose();
    byFocusNode.dispose();

    pricePercentageFocusNode.dispose();
    percentageFocusNode.dispose();

    lightFocusNode.dispose();
    paymentFocusNode.dispose();
    priceLightPaymentFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
                    focusNode: discountNamefocusNode,
                  ),
                  TextFieldWidget(
                    label: 'Descrição',
                    height: 96,
                    controller: descriptionController,
                    focusNode: descriptionfocusNode,
                  ),
                  TextFieldWidget(
                    label: 'Tipo do desconto',
                    enabled: false,
                    controller: discountTypeController,
                    focusNode: discountTypefocusNode,
                  ),
                  Visibility(
                    visible: args.discountForPrice,
                    child: DiscountForPriceWidget(
                      ofController: ofController,
                      byController: byController,
                      ofFocusNode: ofFocusNode,
                      byFocusNode: byFocusNode,
                    ),
                  ),
                  Visibility(
                    visible: args.discountForPercentage,
                    child: DiscountForPercentageWidget(
                      pricePercentageController: pricePercentageController,
                      percentageController: percentageController,
                      pricePercentageFocusNode: pricePercentageFocusNode,
                      percentageFocusNode: percentageFocusNode,
                    ),
                  ),
                  Visibility(
                    visible: args.discountForLightPayment,
                    child: DiscountForLightPaymentWidget(
                      lightController: lightController,
                      paymentController: paymentController,
                      priceLightPaymentController: priceLightPaymentController,
                      lightFocusNode: lightFocusNode,
                      paymentFocusNode: paymentFocusNode,
                      priceLightPaymentFocusNode: priceLightPaymentFocusNode,
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
                          FocusScope.of(context).unfocus();

                          final resultDataActivation =
                              await pickDateTimeActivation(
                            context: context,
                          );

                          if (resultDataActivation == null) return;

                          registerDiscountController.activationDate =
                              resultDataActivation;

                          validatePickActiveDate(
                            activationDate:
                                registerDiscountController.activationDate,
                            inactivationDate:
                                registerDiscountController.inactivationDate,
                          );
                        },
                        inactivationOnTap: () async {
                          FocusScope.of(context).unfocus();
                          if (registerDiscountController.activationDate ==
                              null) {
                            FlushbarErrorWidget(
                              context: context,
                              title: 'Data de ativação não informada',
                              message: 'Selecione a data de ativação',
                            );
                            return;
                          }

                          final dateInactivation =
                              await pickDateTimeInactivation(
                            context: context,
                            dateTime:
                                registerDiscountController.activationDate!,
                          );

                          if (dateInactivation == null) return;

                          registerDiscountController.inactivationDate =
                              dateInactivation;
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
                        onTap: () =>
                            registerDiscountController.getImageGallery(),
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
            onPressed: () {
              registerDiscountController.args = DiscountArgs(
                id: args.id,
                discountName: discountNameController.text,
                description: descriptionController.text,
                discountType: discountTypeController.text,
                priceOf: ofController.text,
                priceBy: byController.text,
                pricePercentage: pricePercentageController.text,
                percentage: percentageController.text,
                light: lightController.text,
                payment: paymentController.text,
                priceLightPayment: priceLightPaymentController.text,
                dateActivation: registerDiscountController.activationDate,
                dateInactivation: registerDiscountController.inactivationDate,
                image: args.image ??
                    registerDiscountController.imageFile!.path.toString(),
              );

              final validateDiscountFields =
                  registerDiscountController.validateFields(
                args: registerDiscountController.args!,
              );

              if (!validateDiscountFields) {
                FlushbarErrorWidget(
                  context: context,
                  title: 'Campos obrigatórios',
                  message: 'Por favor preencha todos os campos',
                );
                return;
              }

              registerDiscountController.saveDiscount(
                args: registerDiscountController.args!,
              );

              Modular.to.pushNamedAndRemoveUntil('/discount', (p0) => false);
            },
          ),
        ),
      ),
    );
  }
}
