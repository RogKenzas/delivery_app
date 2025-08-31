import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:seed/screens/home_screen.dart';
import 'package:seed/theme/design_system.dart';
import 'package:seed/models/shipping_record.dart';
import 'package:seed/utils/navigation_helper.dart';
import 'package:seed/widgets/shipping_filter_tabs.dart';
import 'package:seed/widgets/shipping_record_card.dart';
import 'package:seed/widgets/custom_bottom_navigation.dart';

class ShippingRecordScreen extends StatefulWidget {
  const ShippingRecordScreen({super.key});

  @override
  State<ShippingRecordScreen> createState() => _ShippingRecordScreenState();
}

class _ShippingRecordScreenState extends State<ShippingRecordScreen> {
  ShippingFilter _selectedFilter = ShippingFilter.all;
  int _currentNavIndex = 0;

  // Données d'exemple - sera remplacé par l'API backend
  final List<ShippingRecord> _shippingRecords = [
    ShippingRecord(
      id: 'JK126K532',
      trackingNumber: '34589762',
      dateShipped: DateTime(2024, 7, 13),
      location: 'Aldo',
      status: ShippingStatus.inDelivery,
    ),
    ShippingRecord(
      id: 'JK126K532',
      trackingNumber: '34589762',
      dateShipped: DateTime(2024, 7, 13),
      location: 'Aldo',
      status: ShippingStatus.pending,
    ),
    ShippingRecord(
      id: 'JK126K532',
      trackingNumber: '34589762',
      dateShipped: DateTime(2024, 7, 13),
      location: 'Aldo',
      status: ShippingStatus.complete,
    ),
    ShippingRecord(
      id: 'BP447K85',
      trackingNumber: '78945612',
      dateShipped: DateTime(2024, 7, 10),
      location: 'Douala',
      status: ShippingStatus.inDelivery,
    ),
    ShippingRecord(
      id: 'LK4357S8',
      trackingNumber: '12345678',
      dateShipped: DateTime(2024, 7, 8),
      location: 'Yaoundé',
      status: ShippingStatus.complete,
    ),
  ];

  void _handleNavigation(int index) {
    if (index == _currentNavIndex) return;

    setState(() {
      _currentNavIndex = index;
    });

    // Navigation vers d'autres écrans
    switch (index) {
      case 0:
        NavigationHelper.pushFade(context, HomeScreen());
        break;
      case 1:
        // TODO: Navigation vers Orders/Package
        break;
      case 2:
        // TODO: Navigation vers Delivery/Tracking
        break;
      case 3:
        // TODO: Navigation vers Profile
        break;
      case 4:
        // TODO: Navigation vers Messages
        break;
    }
  }

  void _onFilterChanged(ShippingFilter filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  List<ShippingRecord> get _filteredRecords {
    if (_selectedFilter == ShippingFilter.all) {
      return _shippingRecords;
    }

    return _shippingRecords.where((record) {
      switch (_selectedFilter) {
        case ShippingFilter.complete:
          return record.status == ShippingStatus.complete;
        case ShippingFilter.inDelivery:
          return record.status == ShippingStatus.inDelivery;
        case ShippingFilter.pending:
          return record.status == ShippingStatus.pending;
        default:
          return true;
      }
    }).toList();
  }

  void _onTrack(ShippingRecord record) {
    // TODO: Implémenter le suivi avec l'API backend
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tracking ${record.trackingNumber}...'),
        backgroundColor: AppColors.brandPrimary,
      ),
    );
  }

  void _onViewDetails(ShippingRecord record) {
    // TODO: Navigation vers la page de détails avec l'API backend
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing details for ${record.id}...'),
        backgroundColor: AppColors.brandPrimary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header avec titre et menu
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Shipping Record',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.neutralBlack,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: Implémenter le menu avec l'API backend
                    },
                    icon: const Icon(
                      CupertinoIcons.ellipsis_vertical,
                      color: AppColors.neutralBlack,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Onglets de filtre
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ShippingFilterTabs(
                selectedFilter: _selectedFilter,
                onFilterChanged: _onFilterChanged,
              ),
            ),

            const SizedBox(height: 24),

            // Liste des enregistrements
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                    _filteredRecords.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.cube_box,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No shipping records found',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Try adjusting your filters',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        )
                        : ListView.builder(
                          itemCount: _filteredRecords.length,
                          itemBuilder: (context, index) {
                            final record = _filteredRecords[index];
                            return ShippingRecordCard(
                              record: record,
                              onTrack: () => _onTrack(record),
                              onViewDetails: () => _onViewDetails(record),
                            );
                          },
                        ),
              ),
            ),

            // Barre de navigation inférieure
            CustomBottomNavigation(
              currentIndex: _currentNavIndex,
              onTap: _handleNavigation,
            ),
          ],
        ),
      ),
    );
  }
}
