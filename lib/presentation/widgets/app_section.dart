import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:flutter/material.dart';

class AppSection extends StatelessWidget {
  const AppSection({
    Key? key,
    required this.children,
    this.padding,
  }) : super(key: key);

  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.background,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}