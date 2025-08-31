import 'package:flutter/material.dart';
import 'package:seed/theme/design_system.dart';

enum ShippingStatus { pending, inDelivery, complete, cancelled }

class ShippingRecord {
  final String id;
  final String trackingNumber;
  final DateTime dateShipped;
  final String location;
  final ShippingStatus status;
  final String? destination;
  final String? recipientName;
  final String? recipientPhone;
  final String? description;
  final double? weight;
  final String? carrier;
  final DateTime? estimatedDelivery;
  final DateTime? actualDelivery;
  final List<ShippingEvent>? events;

  ShippingRecord({
    required this.id,
    required this.trackingNumber,
    required this.dateShipped,
    required this.location,
    required this.status,
    this.destination,
    this.recipientName,
    this.recipientPhone,
    this.description,
    this.weight,
    this.carrier,
    this.estimatedDelivery,
    this.actualDelivery,
    this.events,
  });

  factory ShippingRecord.fromJson(Map<String, dynamic> json) {
    return ShippingRecord(
      id: json['id'] as String,
      trackingNumber: json['trackingNumber'] as String,
      dateShipped: DateTime.parse(json['dateShipped'] as String),
      location: json['location'] as String,
      status: ShippingStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => ShippingStatus.pending,
      ),
      destination: json['destination'] as String?,
      recipientName: json['recipientName'] as String?,
      recipientPhone: json['recipientPhone'] as String?,
      description: json['description'] as String?,
      weight: json['weight']?.toDouble(),
      carrier: json['carrier'] as String?,
      estimatedDelivery:
          json['estimatedDelivery'] != null
              ? DateTime.parse(json['estimatedDelivery'] as String)
              : null,
      actualDelivery:
          json['actualDelivery'] != null
              ? DateTime.parse(json['actualDelivery'] as String)
              : null,
      events:
          json['events'] != null
              ? (json['events'] as List)
                  .map((e) => ShippingEvent.fromJson(e as Map<String, dynamic>))
                  .toList()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trackingNumber': trackingNumber,
      'dateShipped': dateShipped.toIso8601String(),
      'location': location,
      'status': status.toString().split('.').last,
      'destination': destination,
      'recipientName': recipientName,
      'recipientPhone': recipientPhone,
      'description': description,
      'weight': weight,
      'carrier': carrier,
      'estimatedDelivery': estimatedDelivery?.toIso8601String(),
      'actualDelivery': actualDelivery?.toIso8601String(),
      'events': events?.map((e) => e.toJson()).toList(),
    };
  }

  String get statusDisplayText {
    switch (status) {
      case ShippingStatus.pending:
        return 'Pending';
      case ShippingStatus.inDelivery:
        return 'In Delivery';
      case ShippingStatus.complete:
        return 'Complete';
      case ShippingStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get statusColor {
    switch (status) {
      case ShippingStatus.pending:
        return const Color(0xFF666666);
      case ShippingStatus.inDelivery:
        return AppColors.brandPrimary;
      case ShippingStatus.complete:
        return const Color(0xFF4CAF50);
      case ShippingStatus.cancelled:
        return const Color(0xFFF44336);
    }
  }

  String get formattedDate {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${dateShipped.day} ${months[dateShipped.month - 1]}. ${dateShipped.year}';
  }
}

class ShippingEvent {
  final String description;
  final DateTime timestamp;
  final String location;
  final String? status;

  ShippingEvent({
    required this.description,
    required this.timestamp,
    required this.location,
    this.status,
  });

  factory ShippingEvent.fromJson(Map<String, dynamic> json) {
    return ShippingEvent(
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      location: json['location'] as String,
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'timestamp': timestamp.toIso8601String(),
      'location': location,
      'status': status,
    };
  }
}
