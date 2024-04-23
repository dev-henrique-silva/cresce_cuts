import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:valevantagens/app/modules/common/widgets/bottom_app_bar_widget.dart';
import 'package:valevantagens/app/modules/discounts/controllers/discounts/discounts_controller.dart';
import 'package:valevantagens/app/modules/discounts/widgets/bottom_sheet_discount_type_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/card_discount_widget.dart';
import 'package:valevantagens/app/modules/discounts/widgets/empty_discount_list_widget.dart';
import 'package:valevantagens/app/modules/home/widgets/skeleton/card_product_skeleton.dart';

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
            Navigator.pop(context);
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          if (discountController.discounts!.result == null) {
            discountController.isLoading = true;
            return CardProductSkeleton();
          }

          if (discountController.discounts!.result.isEmpty) {
            discountController.hideBottomAppBar = true;
            return EmptyDiscountListWidget();
          }

          final discounts = discountController.discounts!.result;
          discountController.isLoading = false;

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            itemCount: discounts.length,
            itemBuilder: (context, index) {
              final discount = discounts[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => {},
                  child: CardDiscountWidget(discount: discount),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomAppBarWidget(
            isLoading: discountController.isLoading,
            hideBottomAppBar: discountController.hideBottomAppBar,
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
        },
      ),
    );
  }
}
