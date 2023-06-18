import 'package:flutter/material.dart';

class ActiveIconButton extends StatelessWidget {
  const ActiveIconButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return IconButton(
      onPressed: onPressed,
      splashColor: Colors.transparent,
      style: IconButton.styleFrom(
        backgroundColor: isSelected ? primaryColor.withOpacity(0.1) : Colors.transparent,
      ),
      icon: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? primaryColor : Colors.grey.withOpacity(0.6),
            ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}