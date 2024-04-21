import 'package:flutter/material.dart';
import 'package:valevantagens/app/modules/common/widgets/bottom_app_bar_widget.dart';
import 'package:valevantagens/app/modules/common/widgets/image_view.dart';
import 'package:valevantagens/app/modules/home/utils/args/view_product_args.dart';
import 'package:valevantagens/app/utils/extensions/double_extensions.dart';

class ViewProductPage extends StatefulWidget {
  final ViewProductArgs args;

  const ViewProductPage({super.key, required this.args});

  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  ViewProductArgs get args => widget.args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0.8,
        shadowColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
        title: Text(
          'Visualizar produtos',
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
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
              child: ImageView(
                urlImage: args.image,
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    args.price.toReal(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 5),
                  Text(
                    args.category,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 20),
                  Text(
                    args.description,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBarWidget(
        title: 'Cadastrar desconto',
        onPressed: () => {},
      ),
    );
  }
}
