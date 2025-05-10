import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersHistoryModel
{
  final String orderId;
  final Timestamp orderDate;
  final bool orderStatus;
  final double orderBill;

  OrdersHistoryModel({required this.orderId, required this.orderDate, required this.orderStatus, required this.orderBill,});

  factory OrdersHistoryModel.fromFirestore(Map<String, dynamic> json) => OrdersHistoryModel(
    orderId: json['orderId'] as String,
    orderDate: json['orderDate'] as Timestamp,
    orderStatus: json['orderStatus'] as bool,
    orderBill: json['orderBill'] as double,
  );
}