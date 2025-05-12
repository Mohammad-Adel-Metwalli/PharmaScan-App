import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmascan/Models/drug_order_model.dart';

class OrdersHistoryModel
{
  final String orderNumber, phoneNumber, email, city;
  final Timestamp orderDate;
  final double totalPrice;
  final List<DrugOrderModel> order;

  OrdersHistoryModel({required this.orderNumber, required this.orderDate, required this.totalPrice, required this.phoneNumber, required this.order, required this.email, required this.city});

  factory OrdersHistoryModel.fromFirestore(Map<String, dynamic> json) => OrdersHistoryModel(
    orderNumber: json['orderNumber'] as String,
    orderDate: json['orderDate'] as Timestamp,
    totalPrice: double.parse(json['totalPrice'].toString()),
    phoneNumber: json['phoneNumber'] as String, 
    order: (json['order'] as List).map((e) => DrugOrderModel.fromFirestore(e)).toList(),
    email: json['email'] as String,
    city: json['city'] as String,
  );
}