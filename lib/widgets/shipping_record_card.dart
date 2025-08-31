import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seed/theme/design_system.dart';
import 'package:seed/models/shipping_record.dart';

class ShippingRecordCard extends StatelessWidget {
  final ShippingRecord record;
  final VoidCallback? onTrack;
  final VoidCallback? onViewDetails;

  const ShippingRecordCard({
    super.key,
    required this.record,
    this.onTrack,
    this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isInDelivery = record.status == ShippingStatus.inDelivery;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isInDelivery ? const Color(0xFF2C2C2C) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header avec icône et statut
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color:
                      isInDelivery
                          ? AppColors.brandPrimary
                          : const Color(0xFFF5F5F5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  CupertinoIcons.cube_box_fill,
                  color: isInDelivery ? Colors.white : const Color(0xFF666666),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID Number: ${record.id}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:
                            isInDelivery
                                ? Colors.white
                                : AppColors.neutralBlack,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      record.statusDisplayText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: record.statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Informations détaillées
          _buildInfoRow(
            'Tracking Number:',
            record.trackingNumber,
            isInDelivery,
          ),
          const SizedBox(height: 12),
          _buildInfoRow('Date Shipped:', record.formattedDate, isInDelivery),
          const SizedBox(height: 12),
          _buildInfoRow('Location:', record.location, isInDelivery),

          const SizedBox(height: 20),

          // Boutons d'action
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onTrack,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.brandPrimary,
                      borderRadius: AppRadii.fullLarge,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.paperplane_fill,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Track',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: onViewDetails,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: AppRadii.fullLarge,
                      border: Border.all(
                        color:
                            isInDelivery
                                ? Colors.white
                                : AppColors.neutralBlack,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      'View Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            isInDelivery
                                ? Colors.white
                                : AppColors.neutralBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool isInDelivery) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isInDelivery ? Colors.white70 : const Color(0xFF666666),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: isInDelivery ? Colors.white : AppColors.neutralBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
