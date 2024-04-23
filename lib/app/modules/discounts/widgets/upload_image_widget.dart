import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:valevantagens/app/modules/common/widgets/image_view.dart';
import 'package:valevantagens/app/modules/discounts/widgets/button_image_gallery_widget.dart';

class UploadImageWidget extends StatelessWidget {
  final String urlImage;
  final File? fileImage;
  final VoidCallback onTap;

  const UploadImageWidget({
    super.key,
    required this.urlImage,
    required this.onTap,
    this.fileImage,
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
            child: GestureDetector(
              onTap: onTap,
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
        ),
        if (fileImage != null)
          Container(
            padding: EdgeInsets.all(10),
            width: 350,
            height: 206,
            child: Center(
                child: Image.file(
              fileImage!,
              fit: BoxFit.fill,
            )),
          ),
        urlImage.isNotEmpty || fileImage != null
            ? Positioned(
                top: 8,
                right: 8,
                child: ButtonImageGalleryWidget(onTap: onTap),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
