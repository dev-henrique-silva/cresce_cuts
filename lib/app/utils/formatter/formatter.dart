import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formatter {
  static toCurrencyReal(dynamic value, TextEditingController controller) {
    final _realBrasilFormat =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    if (value is String && value.isNotEmpty)
      controller.text =
          _realBrasilFormat.format(double.parse(value)).replaceAll('R\$', '');
  }

  static toCurrecyDolar(String value) {
    if (value.isNotEmpty) double.parse(value.trim().replaceAll(',', '.'));
  }

  static String formatterDate(DateTime? dataTime) {
    var formatter = DateFormat('dd/MM/yyyy - HH:mm');
    if (dataTime == null) return '';
    String dateFormatted = formatter.format(dataTime);

    return dateFormatted;
  }
}
