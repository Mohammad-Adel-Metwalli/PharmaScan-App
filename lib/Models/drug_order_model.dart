class DrugOrderModel 
{
  String drugName;
  double drugPrice;
  int drugQuantity;

  DrugOrderModel({required this.drugName, required this.drugPrice, required this.drugQuantity});
  factory DrugOrderModel.fromFirestore(Map<String, dynamic> json) => DrugOrderModel(
    drugName: json['drugName'] as String,
    drugPrice: double.parse(json['drugPrice'].toString()),
    drugQuantity: int.parse(json['drugQuantity'].toString()),
  );
}