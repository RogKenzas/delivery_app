import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seed/theme/design_system.dart';
import 'package:seed/utils/modal_helpers.dart';
import 'package:seed/utils/navigation_helper.dart';
import 'package:seed/widgets/user_profile_header.dart';
import 'package:seed/widgets/tracking_search_bar.dart';
import 'package:seed/widgets/quick_access_button.dart';
import 'package:seed/widgets/shipping_list_item.dart';
import 'package:seed/widgets/custom_bottom_navigation.dart';
import 'package:seed/screens/shipping_record_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final TextEditingController _trackingController = TextEditingController();
  int _currentNavIndex = 0;

  late AnimationController _pageController;
  late Animation<double> _fadeAnimation;

  final List<String> _recentShipments = [
    'Mk8345133',
    'JK126K532',
    'BP447K85',
    'LK4357S8',
    'Mk8345133',
    'JK126K532',
    'BP447K85',
    'LK4357S8',
    'Mk8345133',
    'JK126K532',
    'BP447K85',
    'LK4357S8',
    'Mk8345133',
    'JK126K532',
    'BP447K85',
    'LK4357S8',
    'Mk8345133',
    'JK126K532',
    'BP447K85',
    'LK4357S8',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pageController, curve: Curves.easeInOut),
    );
    _pageController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleNavigation(int index) {
    if (index == _currentNavIndex) return;

    setState(() {
      _currentNavIndex = index;
    });

    switch (index) {
      case 0:
      //   break;
      // case 1: // Orders/Colis
      //   NavigationHelper.pushFade(context, const OrdersScreen());
      //   break;
      // case 2: // Delivery/Tracking
      //   NavigationHelper.pushFade(context, const DeliveryScreen());
      //   break;
      // case 3: // Profile
      //   NavigationHelper.pushFade(context, const ProfileScreen());
      //   break;
      // case 4: // Messages
      //   NavigationHelper.pushFade(context, const MessagesScreen());
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              // Header avec profil utilisateur
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: UserProfileHeader(
                  userName: 'Robert Fox',
                  userDate: '3 July 25',
                  onMenuTap: () {},
                ),
              ),

              // Section de suivi des colis
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TrackingSearchBar(
                  controller: _trackingController,
                  onTrack: () {
                    // TODO: Implémenter suivi
                  },
                  onScanQR: () {
                    // TODO: Implémenter scan QR
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Boutons d'accès rapide
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    QuickAccessButton(
                      icon: CupertinoIcons.circle_fill,
                      label: 'Price',
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        showBottomInfo(
                          context: context,
                          title: 'Price',
                          message: 'Options a venir',
                        );
                      },
                    ),
                    QuickAccessButton(
                      icon: CupertinoIcons.location_fill,
                      label: 'Point',
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        showBottomInfo(
                          context: context,
                          title: 'Point',
                          message: 'Options a venir',
                        );
                      },
                    ),
                    QuickAccessButton(
                      icon: CupertinoIcons.doc_text,
                      label: 'News',
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        showBottomInfo(
                          context: context,
                          title: 'News',
                          message: 'Options a venir',
                        );
                      },
                    ),
                    QuickAccessButton(
                      icon: CupertinoIcons.exclamationmark_circle_fill,
                      label: 'Info',
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        showBottomInfo(
                          context: context,
                          title: 'Infos',
                          message: 'Options a venir',
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Section des expéditions récentes
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Recent Shipping',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColors.neutralBlack,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              NavigationHelper.pushFade(context, const ShippingRecordScreen());
                            },
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _recentShipments.length,
                          itemBuilder: (context, index) {
                            return ShippingListItem(
                              trackingId: _recentShipments[index],
                              onTap: () {
                                // TODO: Implémenter détails de l'expédition
                              },
                            );
                          },
                        ),
                      ),
                    ],
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
      ),
    );
  }
}

// Écrans temporaires pour la navigation
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Commandes'),
        backgroundColor: AppColors.neutralBlack,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Écran des commandes')),
    );
  }
}

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suivi Livraison'),
        backgroundColor: AppColors.neutralBlack,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Écran de suivi de livraison')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: AppColors.neutralBlack,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Écran de profil')),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: AppColors.neutralBlack,
        foregroundColor: Colors.white,
      ),
      body: const Center(child: Text('Écran des messages')),
    );
  }
}
