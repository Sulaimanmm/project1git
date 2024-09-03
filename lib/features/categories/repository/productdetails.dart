import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/productdetails.dart';

Future<ProductDetails> productDetails(int id) async {
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("token");
  var response =
      await http.post(Uri.parse('http://15.206.198.66/api/allproducts'),
          headers: (<String, String>{
            'Authorization': 'Bearer$token',
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json'
          }),
          body: json.encode({'product_type': '$id'}));
  //print(response.statusCode);
  if (response.statusCode == 200) {
    var result = ProductDetails.fromJson(json.decode(response.body));
    print(result.data.productList[1].productId);
    return result;
  } else {
    throw Exception('Failed');
  }
}
