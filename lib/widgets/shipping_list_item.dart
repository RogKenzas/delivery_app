import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed/theme/design_system.dart';

class ShippingListItem extends StatelessWidget {
  final String trackingId;
  final VoidCallback? onTap;

  const ShippingListItem({super.key, required this.trackingId, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppRadii.fullLarge,
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              CupertinoIcons.cube_box,
              color: Colors.grey,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ID Number',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  trackingId,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutralBlack,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: AppRadii.fullLarge,
            ),
            child: IconButton(
              onPressed: onTap,
              icon: const Icon(
                CupertinoIcons.chevron_right,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
