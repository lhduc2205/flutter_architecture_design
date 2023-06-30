import 'package:architecture_designed/core/extensions/extension.dart';
import 'package:architecture_designed/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({
    Key? key,
    required this.initial,
    required this.min,
    required this.max,
    this.onCallback,
  })  : assert(min <= max),
        assert(min <= initial && initial <= max),
        super(key: key);

  final int initial;
  final int min;
  final int max;
  final Function(int)? onCallback;

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  late int currentValue;

  bool get canIncrease => currentValue < widget.max;

  bool get canDecrease => currentValue > widget.min;

  @override
  void initState() {
    currentValue = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: canDecrease ? _decrease : null,
            isSelected: canDecrease,
            style: TextButton.styleFrom(
              shape: const CircleBorder(),
            ),
            icon: const FaIcon(
              FontAwesomeIcons.minus,
              size: 18,
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              minWidth: 35,
            ),
            child: Text(
              currentValue.toString(),
              textAlign: TextAlign.center,
              style: AppStyles.bodyXL,
            ),
          ),
          IconButton(
            onPressed: canIncrease ? _increase : null,
            isSelected: canIncrease,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  void _increase() {
    setState(() => currentValue++);
    if (widget.onCallback != null) {
      widget.onCallback!(currentValue);
    }
  }

  void _decrease() {
    setState(() => currentValue--);
    if (widget.onCallback != null) {
      widget.onCallback!(currentValue);
    }
  }
}
