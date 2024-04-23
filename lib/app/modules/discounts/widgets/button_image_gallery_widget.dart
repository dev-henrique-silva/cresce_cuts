import 'package:flutter/material.dart';

class ButtonImageGalleryWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ButtonImageGalleryWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/app/cloud-upload.png',
            color: Theme.of(context).colorScheme.primary,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
