import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed/screens/home_screen.dart';
import 'package:seed/theme/design_system.dart';
import 'package:seed/utils/navigation_helper.dart';
import 'package:seed/widgets/auth_button.dart';
import 'package:seed/widgets/primary_button.dart';

Future<T?> showBottomInfo<T>({
  required BuildContext context,
  required String title,
  required String message,
  IconData icon = Icons.info_outline,
}) {
  return showModalBottomSheet<T>(
    context: context,
    showDragHandle: true,
    isScrollControlled: false,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(message),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => NavigationHelper.pushFade(context, HomeScreen()),
              child: Container(
                child: AuthButton(
                  label: "Skip Now...",
                  trailingIcon: CupertinoIcons.arrow_right,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
