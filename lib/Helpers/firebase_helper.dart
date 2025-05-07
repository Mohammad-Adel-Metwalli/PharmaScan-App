import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/widgets/custom_cherry_error_toast.dart';
import 'package:pharmascan/widgets/custom_cherry_success_toast.dart';

abstract class FirebaseHelper 
{ 
  static FirebaseAuth firebaeAuthInstance = FirebaseAuth.instance;
  static FirebaseFirestore firebaseFirestoreInstance = FirebaseFirestore.instance;

  static Future<void> authentication({required UserModel userModel, required BuildContext context}) async
  {
    try
    { 
      await firebaeAuthInstance.signInWithEmailAndPassword(email: userModel.email, password: userModel.getPassword); 
      if(context.mounted)
      {
        customCherrySuccessToast(successTitle: 'Success', successMessage: 'Login successfully').show(context);
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
    });
  }
}