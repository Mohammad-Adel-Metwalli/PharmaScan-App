class OrdersHistoryModel
{
  final String orderId;
  final String orderDate;
  final bool orderStatus;
  double orderBill;

  OrdersHistoryModel({required this.orderId, required this.orderDate, required this.orderStatus, required this.orderBill,});
}