import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:valevantagens/app/modules/discounts/utils/args/register_discount_args.dart';

class BottomSheetDiscountTypeWidget extends StatefulWidget {
  final RegisterDiscountArgs? args;
  final String route;

  const BottomSheetDiscountTypeWidget({
    super.key,
    this.args,
    required this.route,
  });

  @override
  State<BottomSheetDiscountTypeWidget> createState() =>
      _BottomSheetDiscountTypeWidgetState();
}

class _BottomSheetDiscountTypeWidgetState
    extends State<BottomSheetDiscountTypeWidget> {
  RegisterDiscountArgs get args => widget.args ?? RegisterDiscountArgs();
  String get route => widget.route;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: [
              Text(
                'Escolha o tipo de desconto',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.attach_money_sharp,
                  size: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Desconto por preço',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 17,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onTap: () {
                  goToRegisterDiscount(
                    args: args.copyWith(
                      discountType: 'Precificação',
                      discountForPrice: true,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.tertiary,
                indent: 20,
                endIndent: 20,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.percent_sharp,
                  size: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Desconto por percentual',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 17,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onTap: () {
                  goToRegisterDiscount(
                    args: args.copyWith(
                      discountType: 'Percentual',
                      discountForPercentage: true,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
              Divider(
                color: Theme.of(context).colorScheme.tertiary,
                indent: 20,
                endIndent: 20,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(
                  Icons.switch_access_shortcut_add_sharp,
                  size: 17,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text(
                  'Desconto por leve pague',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 17,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onTap: () {
                  goToRegisterDiscount(
                    args: args.copyWith(
                      discountType: 'Leve Pague',
                      discountForLightPayment: true,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void goToRegisterDiscount({required RegisterDiscountArgs args}) {
    Modular.to.pushNamed(route, arguments: args);
  }
}
