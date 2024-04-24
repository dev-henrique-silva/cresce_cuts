import 'package:flutter/material.dart';
import 'package:valevantagens/app/modules/discounts/widgets/flushbar_error_widget.dart';
import 'package:valevantagens/app/utils/extensions/double_extensions.dart';

Future pickDateTimeActivation({
  required BuildContext context,
}) async {
  final date = await pickDate(context: context, activation: true);
  if (date == null) return;
  final timeOfDay = await pickTime(context: context);
  if (timeOfDay == null) return;

  return DateTime(
    date.year,
    date.month,
    date.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
}

Future pickDateTimeInactivation({
  required BuildContext context,
  required DateTime dateTime,
}) async {
  if (!validatePickInactiveDate(
    context: context,
    dateTime: dateTime,
  )) return;
  final date = await pickDate(
    context: context,
    activation: false,
    dateTime: dateTime,
  );
  if (date == null) return;
  final timeOfDay = await pickTime(context: context);
  if (timeOfDay == null) return;

  return DateTime(
    date.year,
    date.month,
    date.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );
}

void validatePickActiveDate({
  required DateTime? activationDate,
  required DateTime? inactivationDate,
}) {
  if (inactivationDate != null && inactivationDate.isBefore(activationDate!)) {
    inactivationDate = activationDate.scheduleDateOneDayLater();
  }
}

bool validatePickInactiveDate({
  required BuildContext context,
  DateTime? dateTime,
}) {
  if (dateTime == null) {
    FlushbarErrorWidget(
      context: context,
      title: 'Data de ativação não informada',
      message: 'Por favor, informe a data de ativação',
    );
    return false;
  }
  return true;
}

bool validateDiscountIsActive({
  required DateTime? activationDate,
  required DateTime? inactivationDate,
}) {
  if (activationDate == null || inactivationDate == null) {
    return false;
  }

  DateTime dateTime = DateTime.now();

  final result =
      dateTime.isAfter(activationDate) && dateTime.isBefore(inactivationDate);

  return result;
}

Future<DateTime?> pickDate({
  required BuildContext context,
  required bool activation,
  DateTime? dateTime,
}) {
  return showDatePicker(
    context: context,
    initialDate:
        activation ? DateTime.now() : dateTime!.scheduleDateOneDayLater(),
    firstDate:
        activation ? DateTime.now() : dateTime!.scheduleDateOneDayLater(),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).colorScheme.secondary,
            onPrimary: Theme.of(context).colorScheme.primary,
            surface: Theme.of(context).colorScheme.tertiary,
            onSurface: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        child: child!,
      );
    },
  );
}

Future<TimeOfDay?> pickTime({
  required BuildContext context,
}) {
  return showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).colorScheme.secondary,
            onPrimary: Theme.of(context).colorScheme.primary,
            surface: Theme.of(context).colorScheme.primary,
            onSurface: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        child: child!,
      );
    },
  );
}
