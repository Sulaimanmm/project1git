import 'package:flutter/material.dart';
import 'package:store_key_and_value/features/categories/view/screens/home_main_page.dart';
import 'package:store_key_and_value/features/categories/repository/post.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fromfield = GlobalKey<FormState>();
  TextEditingController uController = TextEditingController();
  TextEditingController pController = TextEditingController();
  var passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fromfield,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: uController,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return ('Please enter the UserName');
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'UserName',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Enter your Name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: pController,
                  obscureText: passToggle,
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return ('Please enter the Password');
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: 'Enter your password',
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off_sharp),
                      )),
                ),
              ),
              TextButton(
                  onPressed: () async {
                    if (_fromfield.currentState!.validate()) {
                      final _date = await textInputDetails(
                          uController.text, pController.text);

                      // final _date = await textInputDetails(
                      //     uController.text, pController.text);
                      // var prefs = await SharedPreferences.getInstance();
                      // var token = prefs.get("token");
                      //  var _name = (_date.data!.name);
                      //print(_date);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeMainPage()));
                    }
                  },
                  child: Text("login"))
            ],
          ),
        ),
      ),
    );
  }
}
