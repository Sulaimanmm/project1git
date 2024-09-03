import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/userdetails.dart';

Future<Model> getUserDetails() async {
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var response = await http.get(
    Uri.parse('http://15.206.198.66/api/get/userprofile'),
    headers: (<String, String>{
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    }),
  );

  if (response.statusCode == 200) {
    var datt = Model.fromJson(json.decode(response.body));

    return datt;
  } else {
    throw Exception("failed");
  }
}

// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);
