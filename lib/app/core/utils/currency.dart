import 'package:intl/intl.dart';

class Currency {
  static String toCurrency(int value) {
    var f = NumberFormat.currency(locale: "pt", symbol: "R\$");

    return f.format(value / 100);
  }
}
