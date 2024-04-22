import 'package:flutter/material.dart';
import 'package:valevantagens/app/modules/common/widgets/skeleton/bottom_app_bar_skeleton.dart';

class BottomAppBarWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool loadingError;

  const BottomAppBarWidget({
    Key? key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.loadingError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (loadingError) {
      return SizedBox.shrink();
    }
    return isLoading
        ? BottomAppBarSkeleton()
        : BottomAppBar(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  fixedSize: Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          );
  }
}
