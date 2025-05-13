import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmascan/Helpers/hive_helper.dart';
import 'package:pharmascan/Models/cart_model.dart';
import 'package:pharmascan/Models/drug_model.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/firebase_options.dart';
import 'package:pharmascan/widgets/custom_cherry_error_toast.dart';
import 'package:pharmascan/widgets/custom_cherry_success_toast.dart'; 
import '../Screens/home_screen.dart';


abstract class FirebaseHelper 
{ 
  static FirebaseAuth firebaeAuthInstance = FirebaseAuth.instance;
  static FirebaseFirestore firebaseFirestoreInstance = FirebaseFirestore.instance; 

  static Future<void> firebaseConfiguration() async
  {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
  
  static Future<void> authentication({required UserModel userModel, required BuildContext context}) async
  {
    try
    { 
      await firebaeAuthInstance.signInWithEmailAndPassword(email: userModel.email, password: userModel.getPassword);
      UserModel userProfile = await FirebaseHelper.getUserProfile(userModel: userModel); 
      HiveHelper.addUserProfile(userModel: userProfile);

      if(context.mounted)
      {
        customCherrySuccessToast(successTitle: 'Success', successMessage: 'Login successfully').show(context);
        Navigator.pop(context); 
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(userModel: userProfile)));
      }
    }

    on FirebaseAuthException catch(e)
    {
      if (e.code == 'user-not-found')
      {
        if(context.mounted)
        {
          customCherryErrorToast(errorTitle: 'Error', errorMessage: 'No user found for that email').show(context);
        }
      }

      else if (e.code == 'wrong-password')
      {
        if(context.mounted)
        {
          customCherryErrorToast(errorTitle: 'Error', errorMessage: 'Wrong password provided for that user').show(context);
        }
      }

      else
      {
        if(context.mounted)
        {
          customCherryErrorToast(errorTitle: 'Error', errorMessage: 'Check again your email or password').show(context);
        }
      }
    }

    catch (e)
    {
      if(context.mounted)
      {
        customCherryErrorToast(errorTitle: 'Error', errorMessage: e.toString()).show(context);
      }
    }
  }

  static Future<void> registeration({required UserModel userModel, required BuildContext context}) async
  {
    try
    { 
      await firebaeAuthInstance.createUserWithEmailAndPassword(email: userModel.email, password: userModel.getPassword); 
      if(context.mounted)
      {
        await addUserProfile(userModel: userModel, context: context);
        if(context.mounted)
        { 
          customCherrySuccessToast(successTitle: 'Success', successMessage: 'Signed Up successfully').show(context);
        }
      }
    }

    on FirebaseAuthException catch (e)
    {
      if (e.code == 'weak-password')
      {
        if(context.mounted)
        {
          customCherryErrorToast(errorTitle: 'Error', errorMessage: 'The password provided is too weak').show(context);
        }
      }

      else if (e.code == 'email-already-in-use')
      {
        if(context.mounted)
        {
          customCherryErrorToast(errorTitle: 'Error', errorMessage: 'The account already exists for that email').show(context);
        }
      }
    }

    catch (e)
    {
      if(context.mounted)
      {
        customCherryErrorToast(errorTitle: 'Error', errorMessage: e.toString()).show(context);
      }
    }
  }

  static Future<void> addUserProfile({required UserModel userModel, required BuildContext context}) async
  {
    await firebaseFirestoreInstance.collection('users').add({
      'email': userModel.email,
      'username': userModel.username,
      'city': userModel.city,
      'phoneNumber': userModel.phoneNumber,
      'isAdmin': userModel.isAdmin,
    });
  }

  static Future<UserModel> getUserProfile({required UserModel userModel}) async
  { 
    QuerySnapshot<Map<String, dynamic>> userProfile = await firebaseFirestoreInstance.collection('users').where('email', isEqualTo: userModel.email).get(); 
    Map<String, dynamic> userData = userProfile.docs.first.data();

    return UserModel(
      '', 
      isLoggedIn: true,
      city: userData['city'], 
      email: userData['email'],
      isAdmin: userData['isAdmin'],
      username: userData['username'],
      phoneNumber: userData['phoneNumber'],
    );
  }

  static Future<DrugModel> fetchDrug({required String barCode}) async
  { 
    QuerySnapshot<Map<String, dynamic>> drug = await firebaseFirestoreInstance.collection('drugs').where('barCode', isEqualTo: barCode).get(); 

    if(drug.docs.isEmpty)
    {
      return DrugModel(
        name: '',
        price: 0.0, 
        quantity: 0,
        description: '',
        barCode: '',
      );
    }

    else
    { 
      Map<String, dynamic> drugData = drug.docs.first.data();
      return DrugModel(
        name: drugData['name'],
        price: drugData['price'], 
        quantity: drugData['quantity'],
        description: drugData['description'],
        barCode: drugData['barCode'],
      );
    }
  }

  static Future<void> placeOrder({required List<CartModel> myCart, required double totalPrice, required UserModel userModel, required int orderNumber}) async
  {
    await firebaseFirestoreInstance.collection('orders').add({
      'order': myCart.map((drug) => {
        'drugName': drug.name,
        'drugPrice': drug.price,
        'drugQuantity': drug.quantity,
      }).toList(),
      'totalPrice': totalPrice,
      'orderDate': Timestamp.now(),
      'email': userModel.email,
      'city': userModel.city,
      'phoneNumber': userModel.phoneNumber, 
      'orderNumber': 'A-$orderNumber',
    });
  } 

  static Future<void> addDrug({required DrugModel drugModel}) async
  {
    await firebaseFirestoreInstance.collection('drugs').add({
      'name': drugModel.name,
      'price': drugModel.price,
      'quantity': drugModel.quantity,
      'description': drugModel.description,
      'barCode': drugModel.barCode, 
    });
  }

  static Future<void> deleteDrug({required String barCode}) async
  {
    QuerySnapshot<Map<String, dynamic>> searchedDrug = await firebaseFirestoreInstance.collection('drugs').where('barCode', isEqualTo: barCode).get();
    await firebaseFirestoreInstance.collection('drugs').doc(searchedDrug.docs.first.id).delete();
  }

  static Future<void> updateDrugQuantity({required DrugModel drugModel, required bool isIncrement}) async
  {
    QuerySnapshot<Map<String, dynamic>> searchedDrug = await firebaseFirestoreInstance.collection('drugs').where('barCode', isEqualTo: drugModel.barCode).get();
    if(isIncrement)
    {
      await firebaseFirestoreInstance.collection('drugs').doc(searchedDrug.docs.first.id).update({
      'name': drugModel.name,
      'price': drugModel.price,
      'quantity': ++drugModel.quantity,
      'description': drugModel.description,
      'barCode': drugModel.barCode, 
      });
    }

    else
    {
      await firebaseFirestoreInstance.collection('drugs').doc(searchedDrug.docs.first.id).update({
      'name': drugModel.name,
      'price': drugModel.price,
      'quantity': --drugModel.quantity,
      'description': drugModel.description,
      'barCode': drugModel.barCode, 
      });
    }
  }

  static Future<void> updateDrug({required DrugModel drugModel}) async
  {
    QuerySnapshot<Map<String, dynamic>> searchedDrug = await firebaseFirestoreInstance.collection('drugs').where('barCode', isEqualTo: drugModel.barCode).get();
    await firebaseFirestoreInstance.collection('drugs').doc(searchedDrug.docs.first.id).update({
      'name': drugModel.name,
      'price': drugModel.price,
      'quantity': drugModel.quantity,
      'description': drugModel.description,
      'barCode': drugModel.barCode, 
    });
  }

  static Future<int> allOrders() async 
  {
    final snapshot = await firebaseFirestoreInstance.collection('orders').get();
    return snapshot.docs.length;
  }

  static Future<int> numberOfAvailableDrugs() async 
  {
    final snapshot = await firebaseFirestoreInstance.collection('drugs').get();
    return snapshot.docs.length;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllDrugs() => firebaseFirestoreInstance.collection('drugs').snapshots(); 
  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllOrders() => firebaseFirestoreInstance.collection('orders').snapshots(); 
}