import 'package:flutter/material.dart';
import 'package:valevantagens/app/modules/common/widgets/image_view.dart';

class DetailsDiscountWidget extends StatelessWidget {
  final String urlImage;
  final String title;
  final String discountType;

  const DetailsDiscountWidget({
    super.key,
    required this.urlImage,
    required this.title,
    required this.discountType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          child: ImageView(
            urlImage: urlImage,
          ),
        ),
        SizedBox(width: 15),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    'Desconto:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(width: 5),
                  Text(
                    discountType,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
        )
      ],
    );
  }
}
