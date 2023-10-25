import 'package:flutter/material.dart';


class Order {
  final String id;
  final String status;
  final String sellerName;
  final double price;
  final String date;

  Order({
    required this.id,
    required this.status,
    required this.sellerName,
    required this.price,
    required this.date,
  });
}


class MyOrdersProvider with ChangeNotifier {
  
  // ignore: prefer_final_fields
  final List<Order> _orders = [
  Order(
    id: "1",
    status: "awaiting",
    sellerName: "حمود حمادي",
    price: 100.0,
    date: "1969-07-20 20:18:00",
  ),
  Order(
    id: "2",
    status: "confirming",
    sellerName: "حمود حمادي",
    price: 50.0,
    date: "1969-07-20 20:18:00",
  ),
  Order(
    id: "3",
    status: "done",
    sellerName: "حامد صالح",
    price: 200.0,
    date: "2023-04-15 14:30:00",
  ),
  Order(
    id: "4",
    status: "confirmed",
    sellerName: "حمود حمادي",
    price: 75.0,
    date: "1969-07-20 20:18:00",
  ),
  Order(
    id: "5",
    status: "testing",
    sellerName: "علي حيدر",
    price: 150.0,
    date: "1969-07-20 20:18:00",
  ),
  Order(
    id: "6",
    status: "canceled",
    sellerName: "علي حيدر",
    price: 150.0,
    date: "2023-04-15 14:30:00",
  ),
  Order(
    id: "7",
    status: "returningItem",
    sellerName: "علي حيدر",
    price: 1990.0,
    date: "1969-07-20 20:18:00",
  ),
];

  List<Order> get orders => _orders;

  // You can add methods to modify the orders, if needed
}