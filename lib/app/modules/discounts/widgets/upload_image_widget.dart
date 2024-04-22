import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:valevantagens/app/modules/common/widgets/image_view.dart';

class UploadImageWidget extends StatelessWidget {
  final String urlImage;

  const UploadImageWidget({
    super.key,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedBorder(
          color: Theme.of(context).colorScheme.onTertiary,
          radius: Radius.circular(10),
          strokeWidth: 2,
          dashPattern: [6, 6],
          borderType: BorderType.RRect,
          child: Container(
            padding: EdgeInsets.all(10),
            width: 350,
            height: 206,
            child: Center(
              child: urlImage.isNotEmpty
                  ? ImageView(urlImage: urlImage)
                  : Image.asset(
                      'assets/images/app/cloud-upload.png',
                      fit: BoxFit.contain,
                    ),
            ),
          ),
        ),
        urlImage.isNotEmpty
            ? Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/app/cloud-upload.png',
                        color: Theme.of(context).colorScheme.primary,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
