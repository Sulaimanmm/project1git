import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> textInputDetails(
  String userName,
  String password,
) async {
  var response = await http.post(
    Uri.parse('https://fakestoreapi.com/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    },
    body: json.encode({
      'username': userName,
      'password': password,
    }),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    final prefs = await SharedPreferences.getInstance();

    if (response.body.isNotEmpty) {
      Map<String, dynamic>? jsonResponse;
      try {
        jsonResponse = json.decode(response.body) as Map<String, dynamic>?;
      } catch (e) {
        throw Exception('Failed to parse JSON response: $e');
      }

      if (jsonResponse != null) {
        // Handle case where response does not contain 'data' but contains 'token'
        if (jsonResponse.containsKey('token')) {
          final token = jsonResponse['token'] as String?;
          if (token != null && token.isNotEmpty) {
            prefs.setString("token", token);
            print('Token saved: $token');
          } else {
            throw Exception('Token is null or empty');
          }
        } else {
          throw Exception('`token` field is missing in response');
        }
      } else {
        throw Exception('Unexpected JSON format: ${response.body}');
      }
    } else {
      throw Exception('Empty response body');
    }
  } else {
    throw Exception('Failed to log in. Status code: ${response.statusCode}');
  }
}
