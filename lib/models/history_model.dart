class HistoryModel {
  final String orderId;
  final String orderDate;
  final bool orderStatus;
  final String orderBill;

  HistoryModel({
    required this.orderId,
    required this.orderDate,
    required this.orderStatus,
    required this.orderBill,
  });
}
