import 'package:flutter/material.dart';

class Product {
  String imageUrl;
  String productName;
  String companyName;
  Color color;
  String price;
  String status;
  Product(
      {this.color,
      this.companyName,
      this.imageUrl,
      this.price,
      this.productName,
      this.status});
}
