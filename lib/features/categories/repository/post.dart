import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login.dart';

Future<Login> textInputDetails(
  String userName,
  String password,
) async {
  var response = await http.post(
    Uri.parse('http://15.206.198.66/api/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    },
    body: json.encode({
      'username': userName,
      'password': password,
    }),
  );

  if ((response.statusCode == 200) || (response.statusCode == 201)) {
    final prefs = await SharedPreferences.getInstance();
    var data = Login.fromJson(json.decode(response.body));
    prefs.setString("token", data.data!.token.toString());

    return data;
  } else {
    throw Exception('Failed');
  }
}
