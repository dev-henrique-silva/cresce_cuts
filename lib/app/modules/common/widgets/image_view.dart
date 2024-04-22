import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String urlImage;
  const ImageView({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      fit: BoxFit.contain,
      placeholder: (context, str) => imagePlaceholder(context),
      errorWidget: (context, obj, str) => noPhotoPlaceholder(context),
    );
  }

  Widget imagePlaceholder(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.tertiary,
      height: 350,
      child: Stack(
        children: <Widget>[
          Center(
            child: new CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary),
              backgroundColor: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }

  Widget noPhotoPlaceholder(BuildContext context) {
    return Container(
      height: 350,
      color: Theme.of(context).colorScheme.tertiary,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.photo_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 80,
            ),
          ],
        ),
      ),
    );
  }
}
