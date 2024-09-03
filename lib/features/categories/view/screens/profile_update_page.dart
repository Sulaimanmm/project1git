import 'dart:io';

import 'package:flutter/material.dart';

import '../../repository/get_user_details.dart';

class ProfileUpdatePage extends StatefulWidget {
  ProfileUpdatePage({
    super.key,
  });

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
                future: getUserDetails(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: 90,
                            height: 160,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.network(
                                snapshot.data?.data.userProfile[0].userImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "UserId : ${snapshot.data!.data.userProfile[0].userId}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "UserName : ${snapshot.data!.data.userProfile[0].userName}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "EmailId : ${snapshot.data!.data.userProfile[0].email}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          "PhoneNo : ${snapshot.data!.data.userProfile[0].phone}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Save"),
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Failed');
                  }
                  return const CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}
