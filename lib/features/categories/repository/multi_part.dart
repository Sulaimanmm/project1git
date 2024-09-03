// // import 'dart:io';
// //
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:http/http.dart' as http;
// //
// // Future<String?> MultiPart() async {
// //   SharedPreferences pref = await SharedPreferences.getInstance();
// //   String? token = pref.getString("token");
// //   var header = ({"Authorization": "Brear $token"});
// //   print(token);
// //   var request = http.MultipartRequest(
// //     'POST',
// //     Uri.parse('http://15.206.198.66/api/user/profile/update'),
// //   );
// //   print(request);
// //
// //   request.files.add(await http.MultipartFile.fromPath(
// //       'profile_photo_path', File(imageFile.path)));
// //
// //   request.headers.addAll(header);
// //   print(header);
// //   http.StreamedResponse response = await request.send();
// //
// //   if (response.statusCode == 200) {
// //     print(await response.stream.bytesToString());
// //   } else {
// //     print(response.reasonPhrase);
// //   }
// // }

// multiPart() async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   String? token = pref.getString("token");
//   var header = ({"Authorization": "Brear $token"});
//   print(token);
//   var request = http.MultipartRequest(
//     'POST',
//     Uri.parse('http://15.206.198.66/api/user/profile/update'),
//   );
//   print('nfkfnmv');
//
//   request.files.add(await http.MultipartFile.fromPath(
//       'profile_photo_path', imageFile! as String));
//
//   request.headers.addAll(header);
//   print(header);
//   http.StreamedResponse response = await request.send();
//
//   var responsed = await http.Response.fromStream(response);
//   final responseData = json.decode(responsed.body);
//
//   if (response.statusCode == 200) {
//     print("Success");
//     print(responseData);
//   } else {
//     print("Error");
//   }
// }
