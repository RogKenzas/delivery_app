import 'package:flutter/material.dart';
import 'package:seed/theme/design_system.dart';

enum ShippingFilter { all, complete, inDelivery, pending }

class ShippingFilterTabs extends StatelessWidget {
  final ShippingFilter selectedFilter;
  final Function(ShippingFilter) onFilterChanged;

  const ShippingFilterTabs({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildFilterTab(ShippingFilter.all, 'All'),
          const SizedBox(width: 12),
          _buildFilterTab(ShippingFilter.complete, 'Complete'),
          const SizedBox(width: 12),
          _buildFilterTab(ShippingFilter.inDelivery, 'In Delivery'),
          const SizedBox(width: 12),
          _buildFilterTab(ShippingFilter.pending, 'Pending'),
        ],
      ),
    );
  }

  Widget _buildFilterTab(ShippingFilter filter, String label) {
    final isSelected = selectedFilter == filter;

    return GestureDetector(
      onTap: () => onFilterChanged(filter),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandPrimary : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                isSelected ? AppColors.brandPrimary : const Color(0xFFE0E0E0),
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.neutralBlack,
          ),
        ),
      ),
    );
  }
}
