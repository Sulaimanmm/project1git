import 'dart:convert';

import 'package:store_key_and_value/features/categories/model/product_full_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<ProductFullDetails> productFullDetails(id) async {
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');

  var response = await http.post(
    Uri.parse('http://15.206.198.66/api/product/detail/$id'),
    headers: (<String, String>{
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    }),
    body: json.encode({'user_id': "{$id}"}),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    var result = ProductFullDetails.fromJson(json.decode(response.body));
    //print("der.data.product[0].id.toString()");
    return result;
  } else {
    throw Exception('Failed');
  }
}
