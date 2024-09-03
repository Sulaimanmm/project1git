import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_key_and_value/features/categories/view/screens/Login_page.dart';
import 'package:store_key_and_value/features/categories/view/screens/product_full_details.dart';
import '../../../../utils/colors/colors.dart';
import '../../repository/productdetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int itemBuilder = 0;

  // Future<String?> share() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final gg = prefs.getString("token");
  //   //print("${gg}");
  //   return gg;
  // }

  // builderFun(String id) {
  //   return Text(
  //     "$id",
  //     style: TextStyle(color: Colors.red),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: FutureBuilder(
                  future: productDetails(0),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          itemCount: snapshot.data!.data.productList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 4 / 7),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(3),
                              child: Container(
                                color: containBckclr,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: InkWell(
                                        onTap: () {
                                          var id = snapshot.data!.data
                                              .productList[index].productId
                                              .toString();
                                          var productName = snapshot.data!.data
                                              .productList[index].productName
                                              .toString();
                                          var CategoryName = snapshot.data!.data
                                              .productList[index].categoryName
                                              .toString();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductAllDetails(
                                                        productName:
                                                            productName,
                                                        id: id,
                                                        CategoryName:
                                                            CategoryName,
                                                      )));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot
                                                      .data!
                                                      .data
                                                      .productList[index]
                                                      .productImage),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "ProductPrice : ${snapshot.data!.data.productList[index].productPrice}",
                                            style: const TextStyle(
                                              fontSize: 12.7,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "ProductDiscount : ${snapshot.data!.data.productList[index].productDiscount}",
                                            style: const TextStyle(
                                              fontSize: 12.7,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "CategoryName : ${snapshot.data!.data.productList[index].categoryName}",
                                            style: const TextStyle(
                                              fontSize: 12.7,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "ProductName : ${snapshot.data!.data.productList[index].productName}",
                                            style: const TextStyle(
                                              fontSize: 12.7,
                                              fontWeight: FontWeight.w400,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                      // return Column(
                      //   children: [
                      //     Text(snapshot
                      //         .data!.data.productList[0].productDiscount),
                      //   ],
                      // );
                      // Text(snapshot.data!.data.productList[4].categoryName
                      //   .toString());
                    } else if (snapshot.hasError) {
                      return const Text("Failed");
                    }
                    return const CircularProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.remove('token');
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        child: const Icon(Icons.image),
      ),
    );
  }
}
