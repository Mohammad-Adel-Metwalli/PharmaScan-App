import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmascan/Models/user_model.dart';
import 'package:pharmascan/utils/constants.dart';

abstract class HiveHelper 
{
  static Future<void> hiveConfiguration() async
  {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<UserModel>(userProfileBox);
  }
  
  static UserModel fetchUserProfile()
  {
    var box = Hive.box<UserModel>(userProfileBox);

    if(box.isEmpty)
    {
      return UserModel('', email: '');
    }

    return box.values.toList().first;
  }

  static void addUserProfile({required UserModel userModel})
  {
    var box = Hive.box<UserModel>(userProfileBox);
    box.add(userModel); 
  }

  static void logout({required UserModel userModel})
  {
    var box = Hive.box<UserModel>(userProfileBox);
    box.compact();
  }
}