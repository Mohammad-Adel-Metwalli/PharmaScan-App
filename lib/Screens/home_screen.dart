import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/Models/orders_history_model.dart';
import 'package:pharmascan/utils/app_colors.dart';
import 'package:pharmascan/widgets/custom_drawer.dart';
import 'package:pharmascan/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
{
  List<DrugModel> drugs = [
    DrugModel(
      name: 'Antinal',
      price: 25,
      quantity: 10,
      barCode: '001',
      description: 'Antinal is a medication used to treat diarrhea and gastrointestinal infections. It contains the active ingredient nifuroxazide, which is an antibacterial agent that helps to reduce the number of bacteria in the intestines. Antinal is commonly used to relieve symptoms such as abdominal pain, cramping, and diarrhea. It is available in various forms, including tablets and oral suspension. It is important to follow the recommended dosage and consult a healthcare professional if symptoms persist or worsen.',
    ),
    DrugModel( 
      name: 'Panadol Extra',
      price: 40,
      quantity: 5,
      barCode: '002',
      description: 'Panadol Extra is a pain relief medication that contains paracetamol and caffeine. It is used to relieve mild to moderate pain, such as headaches, toothaches, and muscle aches. The addition of caffeine enhances the effectiveness of paracetamol in relieving pain. Panadol Extra is available in tablet form and should be taken as directed on the packaging or by a healthcare professional. It is important to avoid exceeding the recommended dosage to prevent potential side effects.',
    ),
    DrugModel(
      name: 'Antinal Forte',
      price: 30,
      quantity: 15,
      barCode: '003',
      description: '',
    ),
    DrugModel(
      name: 'Panadol Night',
      price: 35,
      quantity: 8,
      barCode: '004',
      description: '',
    ),
    DrugModel(
      name: 'Antinal Junior',
      price: 20,
      quantity: 12,
      barCode: '005',
      description: '',
    ),
  ];

  List<OrdersHistoryModel> history = [
    OrdersHistoryModel(
      orderId: '001',
      orderDate: Timestamp.fromDate(DateTime(2025, 4, 25)),
      orderStatus: true,
      orderBill: 150,
    ),
    OrdersHistoryModel(
      orderId: '002',
      orderDate: Timestamp.fromDate(DateTime(2025, 4, 24)),
      orderStatus: false,
      orderBill: 200,
    ),
    OrdersHistoryModel(
      orderId: '003',
      orderDate: Timestamp.fromDate(DateTime(2025, 4, 23)),
      orderStatus: true,
      orderBill: 90,
    ),
    OrdersHistoryModel(
      orderId: '004',
      orderDate: Timestamp.fromDate(DateTime(2025, 4, 22)),
      orderStatus: true,
      orderBill: 300,
    ),
    OrdersHistoryModel(
      orderId: '005',
      orderDate: Timestamp.fromDate(DateTime(2025, 4, 21)),
      orderStatus: false,
      orderBill: 250,
    ),
  ];

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.white,
      body: HomeScreenBody(history: history, drugs: drugs),
    );
  }
}