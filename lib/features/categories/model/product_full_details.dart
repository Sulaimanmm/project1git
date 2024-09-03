// To parse this JSON data, do
//
//     final productFullDetails = productFullDetailsFromJson(jsonString);

import 'dart:convert';

ProductFullDetails productFullDetailsFromJson(String str) =>
    ProductFullDetails.fromJson(json.decode(str));

class ProductFullDetails {
  Data data;

  ProductFullDetails({
    required this.data,
  });

  factory ProductFullDetails.fromJson(Map<String, dynamic> json) =>
      ProductFullDetails(
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  List<Product> product;

  Data({
    required this.product,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  int id;
  int categoryId;
  String categoryName;
  String productName;
  String productPrice;
  String productDiscount;
  String customerPrice;
  String shortDescription;
  String longDescription;
  String currentStock;
  String productSku;
  int discountPercentage;
  String productImage;
  String productVideoUrl;
  String productUrl;
  dynamic isFavourite;
  int colorId;
  String colorName;
  String colorCode;
  List<ProductMultipleImage> productMultipleImage;
  bool cart;
  String cartQty;

  Product({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.productName,
    required this.productPrice,
    required this.productDiscount,
    required this.customerPrice,
    required this.shortDescription,
    required this.longDescription,
    required this.currentStock,
    required this.productSku,
    required this.discountPercentage,
    required this.productImage,
    required this.productVideoUrl,
    required this.productUrl,
    required this.isFavourite,
    required this.colorId,
    required this.colorName,
    required this.colorCode,
    required this.productMultipleImage,
    required this.cart,
    required this.cartQty,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productDiscount: json["product_discount"],
        customerPrice: json["customer_price"],
        shortDescription: json["short_description"],
        longDescription: json["long_description"],
        currentStock: json["current_stock"],
        productSku: json["product_sku"],
        discountPercentage: json["discount_percentage"],
        productImage: json["product_image"],
        productVideoUrl: json["product_video_url"],
        productUrl: json["product_url"],
        isFavourite: json["is_favourite"],
        colorId: json["color_id"] ?? 0,
        colorName: json["color_name"],
        colorCode: json["color_code"],
        productMultipleImage: List<ProductMultipleImage>.from(
            json["product_multiple_image"]
                .map((x) => ProductMultipleImage.fromJson(x))),
        cart: json["cart"],
        cartQty: json["cart_qty"],
      );
}

class ProductMultipleImage {
  int id;
  int productId;
  String productMultipleImage;

  ProductMultipleImage({
    required this.id,
    required this.productId,
    required this.productMultipleImage,
  });

  factory ProductMultipleImage.fromJson(Map<String, dynamic> json) =>
      ProductMultipleImage(
        id: json["id"],
        productId: json["product_id"],
        productMultipleImage: json["product_multiple_image"],
      );
}
