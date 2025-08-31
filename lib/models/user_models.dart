class Address {
  final String? id;
  final String line1;
  final String? line2;
  final String city;
  final String postalCode;
  final String country;

  const Address({
    this.id,
    required this.line1,
    this.line2,
    required this.city,
    required this.postalCode,
    required this.country,
  });
}

class GeoLocation {
  final double latitude;
  final double longitude;
  final DateTime? timestamp;

  const GeoLocation({
    required this.latitude,
    required this.longitude,
    this.timestamp,
  });
}

class VehicleInfo {
  final String type; // moto, voiture, vélo
  final String? brand;
  final String? plateNumber;

  const VehicleInfo({required this.type, this.brand, this.plateNumber});
}

enum UserRole { client, driver, admin }

enum KycStatus { pending, approved, rejected }

class UserProfile {
  final String id;
  final String? externalUid; // Firebase/Keycloak

  // Identité
  final String firstName;
  final String lastName;
  final String? username;
  final String? photoUrl;

  // Contact
  final String email;
  final bool emailVerified;
  final String? phone;
  final bool phoneVerified;

  // Rôles et statut
  final UserRole role;
  final bool isActive;
  final bool isBlocked;
  final String? blockedReason;

  // Adresses et préférences
  final Address? defaultAddress;
  final List<Address> savedAddresses;
  final String languageCode; // fr, en

  // Device/Notif
  final List<String> deviceTokens;

  // Client metrics
  final int ordersCount;
  final double totalSpent;

  // Livreur
  final VehicleInfo? vehicle;
  final KycStatus? kycStatus;
  final double? rating;
  final int? deliveriesCount;
  final bool? available;
  final GeoLocation? lastLocation;

  // Dates
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserProfile({
    required this.id,
    this.externalUid,
    required this.firstName,
    required this.lastName,
    this.username,
    this.photoUrl,
    required this.email,
    this.emailVerified = false,
    this.phone,
    this.phoneVerified = false,
    this.role = UserRole.client,
    this.isActive = true,
    this.isBlocked = false,
    this.blockedReason,
    this.defaultAddress,
    this.savedAddresses = const [],
    this.languageCode = 'fr',
    this.deviceTokens = const [],
    this.ordersCount = 0,
    this.totalSpent = 0.0,
    this.vehicle,
    this.kycStatus,
    this.rating,
    this.deliveriesCount,
    this.available,
    this.lastLocation,
    required this.createdAt,
    required this.updatedAt,
  });
}
