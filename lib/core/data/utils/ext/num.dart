import 'package:intl/intl.dart';

extension NumberFormatter on num {
  String toFormattedNumber({String locale = 'id'}) {
    final formatter = NumberFormat.decimalPattern(locale);
    return formatter.format(this);
  }
}
