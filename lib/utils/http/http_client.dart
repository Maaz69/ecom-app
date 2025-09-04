import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  /// Base URL (Can be customized)
  static const String baseUrl = "https://api.example.com";

  /// -- GET Request
  static Future<dynamic> getRequest(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(url);
      return _processResponse(response);
    } catch (e) {
      return {'error': 'Failed to connect: $e'};
    }
  }

  /// -- POST Request
  static Future<dynamic> postRequest(String endpoint,
      Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return _processResponse(response);
    } catch (e) {
      return {'error': 'Failed to connect: $e'};
    }
  }

  /// -- PUT Request
  static Future<dynamic> putRequest(String endpoint,
      Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      return _processResponse(response);
    } catch (e) {
      return {'error': 'Failed to connect: $e'};
    }
  }

  /// -- DELETE Request
  static Future<dynamic> deleteRequest(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.delete(url);
      return _processResponse(response);
    } catch (e) {
      return {'error': 'Failed to connect: $e'};
    }
  }

  /// -- Private Method: Process HTTP Response
  static dynamic _processResponse(http.Response response) {
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    // Success with a valid response
    if ((response.statusCode == 200 || response.statusCode == 201) &&
        response.body.isNotEmpty) {
      try {
        return jsonDecode(response.body);
      } catch (e) {
        return {'error': 'Invalid JSON response', 'exception': e.toString()};
      }
    }

    // Non-200/201 response or empty body
    return {
      'error': 'Request failed with status: ${response.statusCode}',
      'body': response.body
    };
  }
}
