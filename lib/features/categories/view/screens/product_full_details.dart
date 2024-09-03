import 'package:flutter/material.dart';
import 'package:store_key_and_value/features/categories/repository/product_full_details.dart';

// ignore: must_be_immutable
class ProductAllDetails extends StatefulWidget {
  ProductAllDetails(
      {super.key,
      required this.id,
      required this.productName,
      required this.CategoryName});
  String id, productName, CategoryName;

  @override
  State<ProductAllDetails> createState() => _ProductAllDetailsState();
}

class _ProductAllDetailsState extends State<ProductAllDetails> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.CategoryName),
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FutureBuilder(
                      future: productFullDetails(widget.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  snapshot
                                      .data!.data.product[0].shortDescription,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot.data!
                                              .data.product[0].productImage),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Text(
                                "ProductPrice : ${snapshot.data!.data.product[0].productPrice}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "ProductDiscount : ${snapshot.data!.data.product[0].productDiscount}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "CategoryName : ${snapshot.data!.data.product[0].categoryName}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "CurrentStock : ${snapshot.data!.data.product[0].currentStock}",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        return const CircularProgressIndicator();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
