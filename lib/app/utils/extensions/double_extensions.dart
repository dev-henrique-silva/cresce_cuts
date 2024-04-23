import 'package:intl/intl.dart';

extension RealFormat on num {
  String toReal() {
    final format = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return format.format(this);
  }
}

extension DateTimeExtension on DateTime {
  DateTime scheduleDateOneDayLater() {
    return this.add(Duration(days: 1));
  }
}
