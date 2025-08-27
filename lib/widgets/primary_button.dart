import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? trailingIcon;

  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 16),
        shape: const StadiumBorder(),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          if (trailingIcon != null) ...[
            const SizedBox(width: 8),
            Icon(trailingIcon, size: 20),
          ],
        ],
      ),
    );
  }
}
