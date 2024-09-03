class ProductDetails {
  Data data;
  int count;
  int total;
  int currentPage;
  int lastPage;

  ProductDetails({
    required this.data,
    required this.count,
    required this.total,
    required this.currentPage,
    required this.lastPage,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
        data: Data.fromJson(json["data"]),
        count: json["count"],
        total: json["total"],
        currentPage: json["currentPage"],
        lastPage: json["lastPage"],
      );
}

class Data {
  List<ProductList> productList;

  Data({required this.productList});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        productList: List<ProductList>.from(
            json["product_list"].map((x) => ProductList.fromJson(x))),
      );
}

class ProductList {
  int productId;
  int categoryId;
  String categoryName;
  String productName;
  String productPrice;
  String productDiscount;
  String productImage;
  dynamic isFavourite;

  ProductList({
    required this.productId,
    required this.categoryId,
    required this.categoryName,
    required this.productName,
    required this.productPrice,
    required this.productDiscount,
    required this.productImage,
    required this.isFavourite,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        productId: json["product_id"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productDiscount: json["product_discount"],
        productImage: json["product_image"],
        isFavourite: json["is_favourite"],
      );
}
