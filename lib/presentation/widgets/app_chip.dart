import 'package:flutter/material.dart';

class AppChip extends Chip {
  const AppChip({
    required super.label,
    super.key,
    super.backgroundColor,
    super.labelStyle
  }) : super(
          shape: const StadiumBorder(),
          elevation: 0,
          side: BorderSide.none,
        );
}
