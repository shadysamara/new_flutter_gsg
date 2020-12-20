import 'package:flutter/material.dart';
import 'package:gsg_flutter/excersice/model/product_model.dart';

List<String> orderStatus = ['All', 'Placed', 'Deleverd', 'Accounting'];
List<Product> products = [
  Product(
    imageUrl: 'assets/images/product1.jpg',
    companyName: 'Loto LTD',
    price: '\$3220',
    productName: 'Sofa',
    status: orderStatus[1],
    color: Colors.red,
  ),
  Product(
    imageUrl: 'assets/images/product4.jpg',
    companyName: 'Samsung',
    price: '\$1500',
    productName: 'Phone',
    status: orderStatus[2],
    color: Colors.yellow,
  ),
  Product(
    imageUrl: 'assets/images/product3.jpg',
    companyName: 'Loto LTD',
    price: '\$3220',
    productName: 'Sofa',
    status: orderStatus[3],
    color: Colors.black,
  ),
  Product(
    imageUrl: 'assets/images/product4.jpg',
    companyName: 'Loto LTD',
    price: '\$3220',
    productName: 'Sofa',
    status: orderStatus[2],
    color: Colors.cyan,
  ),
  Product(
      imageUrl: 'assets/images/product2.jpg',
      companyName: 'Loto LTD',
      price: '\$3220',
      productName: 'Sofa',
      status: orderStatus[1],
      color: Colors.green),
  Product(
    imageUrl: 'assets/images/product3.jpg',
    companyName: 'Loto LTD',
    price: '\$3220',
    productName: 'Sofa',
    status: orderStatus[2],
    color: Colors.red,
  ),
  Product(
    imageUrl: 'assets/images/product1.jpg',
    companyName: 'Loto LTD',
    price: '\$3220',
    productName: 'Sofa',
    status: orderStatus[3],
    color: Colors.orange,
  ),
  Product(
    imageUrl: 'assets/images/product3.jpg',
    companyName: 'LG',
    price: '\$3220',
    productName: 'TV',
    status: orderStatus[2],
    color: Colors.green,
  ),
  Product(
    imageUrl: 'assets/images/product3.jpg',
    companyName: 'Apple',
    price: '\$3300',
    productName: 'Labtop',
    status: orderStatus[3],
    color: Colors.orange,
  ),
  Product(
    imageUrl: 'assets/images/product2.jpg',
    companyName: 'Flutter',
    price: '\$250',
    productName: 'App',
    status: orderStatus[2],
    color: Colors.blue,
  )
];
