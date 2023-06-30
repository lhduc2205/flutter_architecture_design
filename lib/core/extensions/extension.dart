import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ColorSchemeX on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension MediaQueryX on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;
}

extension MoneyFormatX on int {
  String get toUSD {
    return NumberFormat.currency(symbol: '\$').format(this);
  }
}