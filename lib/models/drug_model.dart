class DrugModel 
{ 
  String name, barCode, description; 
  double price; 
  int quantity;

  DrugModel({required this.name, required this.price, required this.quantity, required this.barCode, required this.description,});

  factory DrugModel.fromFirestore(Map<String, dynamic> json) => DrugModel(
    name: json['name'] as String,
    price: double.parse(json['price'].toString()),
    quantity: json['quantity'] as int,
    barCode: json['barCode'] as String,
    description: json['description'] as String,
  );
}