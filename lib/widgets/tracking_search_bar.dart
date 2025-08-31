import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seed/theme/design_system.dart';

class TrackingSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onTrack;
  final VoidCallback? onScanQR;

  const TrackingSearchBar({
    super.key,
    required this.controller,
    this.onTrack,
    this.onScanQR,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.neutralBlack,
        borderRadius: AppRadii.large,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Track our parcels now.',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Please enter your tracking number below to continue.',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: AppRadii.fullLarge,
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Track Your Package',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  decoration: BoxDecoration(
                    color: AppColors.neutralBlack,
                    borderRadius: AppRadii.fullLarge,
                  ),
                  child: IconButton(
                    onPressed: onScanQR,
                    icon: const Icon(
                      CupertinoIcons.qrcode_viewfinder,
                      color: AppColors.neutralWhite,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
