import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_key_and_value/features/categories/view/screens/Login_page.dart';
import 'package:store_key_and_value/features/categories/view/screens/home_main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.get("token");

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Store key and value in disk',
    home: token == null ? LoginPage() : HomeMainPage(),
  ));
}

//
