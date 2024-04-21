import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:valevantagens/app/modules/common/widgets/bottom_app_bar_widget.dart';
import 'package:valevantagens/app/modules/home/controllers/home_controller.dart';
import 'package:valevantagens/app/modules/home/widgets/card_products_widget.dart';
import 'package:valevantagens/app/modules/home/widgets/loading_erro_products_widget.dart';
import 'package:valevantagens/app/modules/home/widgets/skeleton/card_product_skeleton.dart';
import 'package:valevantagens/app/utils/args/view_product_args.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController get controller => widget.controller;

  @override
  void initState() {
    controller.fetchProducts();
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
          'Vale Vantagens',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (controller.productFuture == null ||
              controller.productFuture!.status == FutureStatus.pending) {
            controller.isLoading = true;
            return CardProductSkeleton();
          }

          if (controller.productFuture!.status == FutureStatus.rejected) {
            controller.loadingError = true;
            return LoadingErroProductsWidget();
          }

          final products = controller.productFuture!.result;
          controller.isLoading = false;

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => {
                    Modular.to.pushNamed(
                      './view_product',
                      arguments: ViewProductArgs(
                        image: product.image,
                        title: product.title,
                        price: product.price,
                        category: product.category,
                        description: product.description,
                      ),
                    ),
                  },
                  child: CardProductWidget(
                    product: products[index],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomAppBarWidget(
            isLoading: controller.isLoading,
            loadingError: controller.loadingError,
            title: 'Desconto',
            onPressed: () => {},
          );
        },
      ),
    );
  }
}
