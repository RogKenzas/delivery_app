import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seed/models/shipping_record.dart';
import 'package:seed/widgets/shipping_filter_tabs.dart';
import 'package:seed/config/app_config.dart';

class ShippingService {
  static const String _baseUrl = AppConfig.apiBaseUrl;
  static const String _apiKey = AppConfig.apiKey;

  // Headers pour l'authentification
  static Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $_apiKey',
    'Accept': 'application/json',
  };

  // Récupérer tous les enregistrements d'expédition
  static Future<List<ShippingRecord>> getShippingRecords({
    ShippingFilter? filter,
    int? page,
    int? limit,
  }) async {
    try {
      final queryParams = <String, String>{};
      if (filter != null && filter != ShippingFilter.all) {
        queryParams['status'] = filter.toString().split('.').last;
      }
      if (page != null) queryParams['page'] = page.toString();
      if (limit != null) queryParams['limit'] = limit.toString();

      final uri = Uri.parse(
        '$_baseUrl/shipping-records',
      ).replace(queryParameters: queryParams);

      final response = await http.get(uri, headers: _headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        return data.map((json) => ShippingRecord.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to load shipping records: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching shipping records: $e');
    }
  }

  // Récupérer un enregistrement spécifique par ID
  static Future<ShippingRecord> getShippingRecordById(String id) async {
    try {
      final uri = Uri.parse('$_baseUrl/shipping-records/$id');
      final response = await http.get(uri, headers: _headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ShippingRecord.fromJson(data);
      } else {
        throw Exception(
          'Failed to load shipping record: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching shipping record: $e');
    }
  }

  // Suivre un enregistrement par numéro de suivi
  static Future<ShippingRecord> trackShippingRecord(
    String trackingNumber,
  ) async {
    try {
      final uri = Uri.parse('$_baseUrl/shipping-records/track/$trackingNumber');
      final response = await http.get(uri, headers: _headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ShippingRecord.fromJson(data);
      } else {
        throw Exception(
          'Failed to track shipping record: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error tracking shipping record: $e');
    }
  }

  // Créer un nouvel enregistrement d'expédition
  static Future<ShippingRecord> createShippingRecord(
    Map<String, dynamic> recordData,
  ) async {
    try {
      final uri = Uri.parse('$_baseUrl/shipping-records');
      final response = await http.post(
        uri,
        headers: _headers,
        body: json.encode(recordData),
      );

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        return ShippingRecord.fromJson(data);
      } else {
        throw Exception(
          'Failed to create shipping record: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error creating shipping record: $e');
    }
  }

  // Mettre à jour un enregistrement d'expédition
  static Future<ShippingRecord> updateShippingRecord(
    String id,
    Map<String, dynamic> updates,
  ) async {
    try {
      final uri = Uri.parse('$_baseUrl/shipping-records/$id');
      final response = await http.put(
        uri,
        headers: _headers,
        body: json.encode(updates),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return ShippingRecord.fromJson(data);
      } else {
        throw Exception(
          'Failed to update shipping record: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error updating shipping record: $e');
    }
  }

  // Supprimer un enregistrement d'expédition
  static Future<bool> deleteShippingRecord(String id) async {
    try {
      final uri = Uri.parse('$_baseUrl/shipping-records/$id');
      final response = await http.delete(uri, headers: _headers);

      return response.statusCode == 204;
    } catch (e) {
      throw Exception('Error deleting shipping record: $e');
    }
  }

  // Récupérer l'historique des événements d'un enregistrement
  static Future<List<ShippingEvent>> getShippingEvents(String id) async {
    try {
      final uri = Uri.parse('$_baseUrl/shipping-records/$id/events');
      final response = await http.get(uri, headers: _headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        return data.map((json) => ShippingEvent.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to load shipping events: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching shipping events: $e');
    }
  }

  // Rechercher des enregistrements
  static Future<List<ShippingRecord>> searchShippingRecords(
    String query,
  ) async {
    try {
      final uri = Uri.parse(
        '$_baseUrl/shipping-records/search',
      ).replace(queryParameters: {'q': query});
      final response = await http.get(uri, headers: _headers);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        return data.map((json) => ShippingRecord.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to search shipping records: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Error searching shipping records: $e');
    }
  }
}
