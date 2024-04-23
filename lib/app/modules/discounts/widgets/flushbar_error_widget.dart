import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushbarErrorWidget {
  String title;
  String message;
  Duration? duration;
  Icon? icon;
  final context;

  FlushbarErrorWidget({
    required this.context,
    required this.title,
    required this.message,
    this.duration,
    this.icon,
  }) {
    Flushbar(
      titleText: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      messageText: Text(
        message,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      messageColor: Theme.of(context).colorScheme.primary,
      duration: duration ?? const Duration(seconds: 5),
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(10),
      backgroundColor: Theme.of(context).colorScheme.error,
      icon: Icon(
        Icons.cancel,
        color: Theme.of(context).colorScheme.primary,
      ),
    ).show(context);
  }
}
