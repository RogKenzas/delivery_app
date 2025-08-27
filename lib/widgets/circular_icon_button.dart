import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color iconColor;

  const CircularIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor = Colors.black,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: const SizedBox(
          width: 56,
          height: 56,
          child: Center(child: Icon(Icons.chevron_left, color: Colors.white)),
        ),
      ),
    );
  }
}
