import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valevantagens/app/modules/common/widgets/bottom_app_bar_widget.dart';
import 'package:valevantagens/app/modules/discounts/controllers/discounts/discounts_controller.dart';
import 'package:valevantagens/app/modules/discounts/widgets/bottom_sheet_discount_type_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/card_discount_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/dismissible_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/empty_discount_list_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/skeleton/card_descount_skeleton.dart';

class DiscountsPage extends StatefulWidget {
  final DiscountController discountController;

  DiscountsPage({
    super.key,
    required this.discountController,
  });

  @override
  State<DiscountsPage> createState() => _DiscountsPageState();
}

class _DiscountsPageState extends State<DiscountsPage> {
  DiscountController get discountController => widget.discountController;

  @override
  void initState() {
    discountController.fetchAllDatabase();
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
          'Descontos',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () {
            Modular.to.pushNamedAndRemoveUntil('/', (p0) => false);
          },
        ),
        actions: [
          Observer(
            builder: (_) {
              return discountController.discounts != null &&
                      discountController.discounts!.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () {
                          deleteAllDiscounts();
                        },
                      ),
                    )
                  : Container();
            },
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (discountController.discounts == null) {
            return CardDiscountSkeleton();
          }

          if (discountController.discounts!.isEmpty) {
            return EmptyDiscountListWidget();
          }

          final discounts = discountController.discounts!;

          discountController.verifyActiveDiscounts(discounts);

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            itemCount: discounts.length,
            itemBuilder: (context, index) {
              final discount = discounts[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DismissibleWidget(
                  child: GestureDetector(
                    onTap: () => {
                      Modular.to
                          .pushNamed(
                        '/details_discount',
                        arguments: discount,
                      )
                          .then((value) {
                        discountController.fetchAllDatabase();
                      }),
                    },
                    child: CardDiscountWidget(
                      discount: discount,
                      discountController: discountController,
                    ),
                  ),
                  onPressed: () {
                    discountController.deleteDiscount(id: discount.id!);
                    Navigator.pop(context);
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Observer(builder: (context) {
        return BottomAppBarWidget(
          isLoading: discountController.discounts == null,
          title: 'Cadastrar desconto',
          onPressed: () => {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BottomSheetDiscountTypeWidget(
                  route: '/register_discount',
                );
              },
            ),
          },
        );
      }),
    );
  }

  void deleteAllDiscounts() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Apagar todos os descontos',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Text(
            'Deseja realmente apagar todos os descontos?',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                discountController.deleteAllDatabase();
                Navigator.pop(context);
              },
              child: Text(
                'Confirmar',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
