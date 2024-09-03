import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_key_and_value/features/categories/view/screens/profile_update_page.dart';
import 'package:store_key_and_value/utils/colors/colors.dart';
import '../../repository/get_user_details.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });
  //     required this.image,
  //     required this.name,
  //     required this.pinCode,
  //     required this.shopName});
  // String image, name, pinCode, shopName;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<String?> multiPart(File image, String name) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://15.206.198.66/api/user/profile/update'),
    );

    request.files.add(
        await http.MultipartFile.fromPath('profile_photo_path', image.path));
    request.fields.addAll({"name": name});

    request.headers.addAll({"Authorization": "Bearer $token"});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  // Future<XFile?> camera() async {
  //   XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (photo != null) {
  //     setState(() {
  //       imageFile = File(photo.path);
  //       Navigator.pop(context);
  //     });
  //   }
  // }
  //
  // Future<XFile?> gallery() async {
  //   XFile? photo = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (photo != null) {
  //     setState(() {
  //       imageFile = File(photo.path);
  //       Navigator.pop(context);
  //     });
  //   }
  //   print(photo!.path.toString());
  // }
  File? imageFile;
  _show(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: containBckclr,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        builder: ((buildContext) {
          return Container(
            color: containBckclr,
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Choose the Profile Picture",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.teal),
                ),
                SizedBox(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.teal,
                              ),
                              Text(
                                "Gallery",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.teal),
                              )
                            ],
                          ),
                          onTap: () async {
                            XFile? photo = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (photo != null) {
                              setState(() {
                                imageFile = File(photo.path);
                                Navigator.pop(context);
                              });
                            }
                          }),
                      const SizedBox(
                        width: 60,
                      ),
                      InkWell(
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera,
                              size: 30,
                              color: Colors.teal,
                            ),
                            Text(
                              "Camera",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.teal),
                            )
                          ],
                        ),
                        onTap: () async {
                          XFile? photo = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (photo != null) {
                            setState(() {
                              imageFile = File(photo.path);
                              Navigator.pop(context);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }

  // File? imageFile;
  // final imagePicker = ImagePicker();
  //
  // Future getImage() async {
  //   final file = await ImagePicker().pickImage(source: );
  //   if (file?.path != null) {
  //     setState(() {
  //       imageFile = File(file!.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
                future: getUserDetails(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileUpdatePage()));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.teal,
                                    size: 30,
                                  ))
                            ]),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: imageFile != null
                                  ? Image.file(File(imageFile!.path))
                                  : snapshot.data!.data.userProfile[0].userImage
                                          .isEmpty
                                      ? Image.asset('assets/flutter.png')
                                      : Image.network(
                                          snapshot.data!.data.userProfile[0]
                                              .userImage,
                                          fit: BoxFit.cover,
                                        ),
                            ),
                            Positioned(
                              bottom: 15.0,
                              right: 20.0,
                              child: InkWell(
                                onTap: () {
                                  _show(context);
                                },
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 35,
                                  color: Colors.teal,
                                ),
                              ),
                            )
                          ],
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
                        FilledButton(
                          onPressed: () {
                            var image = imageFile;
                            var name = snapshot
                                .data!.data.userProfile[0].userName
                                .toString();
                            multiPart(image!, name);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileUpdatePage()));
                          },
                          child: Text("Save"),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Faled');
                  }
                  return const CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}
