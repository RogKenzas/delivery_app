import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seed/models/shipping_record.dart';
import 'package:seed/widgets/shipping_filter_tabs.dart';
import 'package:seed/widgets/shipping_record_card.dart';

void main() {
  group('ShippingRecord Model Tests', () {
    test('should create ShippingRecord from JSON', () {
      final json = {
        'id': 'JK126K532',
        'trackingNumber': '34589762',
        'dateShipped': '2024-07-13T00:00:00.000Z',
        'location': 'Aldo',
        'status': 'inDelivery',
      };

      final record = ShippingRecord.fromJson(json);

      expect(record.id, 'JK126K532');
      expect(record.trackingNumber, '34589762');
      expect(record.location, 'Aldo');
      expect(record.status, ShippingStatus.inDelivery);
    });

    test('should convert ShippingRecord to JSON', () {
      final record = ShippingRecord(
        id: 'JK126K532',
        trackingNumber: '34589762',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Aldo',
        status: ShippingStatus.inDelivery,
      );

      final json = record.toJson();

      expect(json['id'], 'JK126K532');
      expect(json['trackingNumber'], '34589762');
      expect(json['status'], 'inDelivery');
    });

    test('should return correct status display text', () {
      final pendingRecord = ShippingRecord(
        id: 'TEST1',
        trackingNumber: '123',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.pending,
      );
      final inDeliveryRecord = ShippingRecord(
        id: 'TEST2',
        trackingNumber: '456',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.inDelivery,
      );
      final completeRecord = ShippingRecord(
        id: 'TEST3',
        trackingNumber: '789',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.complete,
      );
      final cancelledRecord = ShippingRecord(
        id: 'TEST4',
        trackingNumber: '012',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.cancelled,
      );

      expect(pendingRecord.statusDisplayText, 'Pending');
      expect(inDeliveryRecord.statusDisplayText, 'In Delivery');
      expect(completeRecord.statusDisplayText, 'Complete');
      expect(cancelledRecord.statusDisplayText, 'Cancelled');
    });

    test('should return correct status colors', () {
      final pendingRecord = ShippingRecord(
        id: 'TEST1',
        trackingNumber: '123',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.pending,
      );
      final inDeliveryRecord = ShippingRecord(
        id: 'TEST2',
        trackingNumber: '456',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.inDelivery,
      );
      final completeRecord = ShippingRecord(
        id: 'TEST3',
        trackingNumber: '789',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.complete,
      );
      final cancelledRecord = ShippingRecord(
        id: 'TEST4',
        trackingNumber: '012',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.cancelled,
      );

      expect(pendingRecord.statusColor, const Color(0xFF666666));
      expect(inDeliveryRecord.statusColor, const Color(0xFFFF7A00));
      expect(completeRecord.statusColor, const Color(0xFF4CAF50));
      expect(cancelledRecord.statusColor, const Color(0xFFF44336));
    });

    test('should format date correctly', () {
      final record = ShippingRecord(
        id: 'TEST',
        trackingNumber: '123',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.pending,
      );

      expect(record.formattedDate, '13 Jul. 2024');
    });
  });

  group('ShippingFilterTabs Widget Tests', () {
    testWidgets('should display all filter tabs', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShippingFilterTabs(
              selectedFilter: ShippingFilter.all,
              onFilterChanged: (filter) {},
            ),
          ),
        ),
      );

      expect(find.text('All'), findsOneWidget);
      expect(find.text('Complete'), findsOneWidget);
      expect(find.text('In Delivery'), findsOneWidget);
      expect(find.text('Pending'), findsOneWidget);
    });

    testWidgets('should call onFilterChanged when tab is tapped', (
      WidgetTester tester,
    ) async {
      ShippingFilter? selectedFilter;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShippingFilterTabs(
              selectedFilter: ShippingFilter.all,
              onFilterChanged: (filter) {
                selectedFilter = filter;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Complete'));
      await tester.pump();

      expect(selectedFilter, ShippingFilter.complete);
    });
  });

  group('ShippingRecordCard Widget Tests', () {
    testWidgets('should display shipping record information', (
      WidgetTester tester,
    ) async {
      final record = ShippingRecord(
        id: 'JK126K532',
        trackingNumber: '34589762',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Aldo',
        status: ShippingStatus.inDelivery,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShippingRecordCard(
              record: record,
              onTrack: () {},
              onViewDetails: () {},
            ),
          ),
        ),
      );

      expect(find.text('ID Number: JK126K532'), findsOneWidget);
      expect(find.text('Tracking Number: 34589762'), findsOneWidget);
      expect(find.text('Date Shipped: 13 Jul. 2024'), findsOneWidget);
      expect(find.text('Location: Aldo'), findsOneWidget);
      expect(find.text('In Delivery'), findsOneWidget);
      expect(find.text('Track'), findsOneWidget);
      expect(find.text('View Details'), findsOneWidget);
    });

    testWidgets('should call onTrack when track button is tapped', (
      WidgetTester tester,
    ) async {
      bool trackCalled = false;

      final record = ShippingRecord(
        id: 'TEST',
        trackingNumber: '123',
        dateShipped: DateTime(2024, 7, 13),
        location: 'Test',
        status: ShippingStatus.pending,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ShippingRecordCard(
              record: record,
              onTrack: () {
                trackCalled = true;
              },
              onViewDetails: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('Track'));
      await tester.pump();

      expect(trackCalled, true);
    });

    testWidgets(
      'should call onViewDetails when view details button is tapped',
      (WidgetTester tester) async {
        bool detailsCalled = false;

        final record = ShippingRecord(
          id: 'TEST',
          trackingNumber: '123',
          dateShipped: DateTime(2024, 7, 13),
          location: 'Test',
          status: ShippingStatus.pending,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ShippingRecordCard(
                record: record,
                onTrack: () {},
                onViewDetails: () {
                  detailsCalled = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('View Details'));
        await tester.pump();

        expect(detailsCalled, true);
      },
    );
  });
}
