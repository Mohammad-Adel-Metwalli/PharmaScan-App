import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel
{
  @HiveField(0)
  String email;

  String _password;
  
  @HiveField(1)
  String username;
  
  @HiveField(2)
  String city;
  
  @HiveField(3)
  String phoneNumber;

  @HiveField(4)
  bool isAdmin;

  @HiveField(5)
  bool isLoggedIn;

  UserModel(this._password, {required this.email, this.username = '', this.city = '', this.phoneNumber = '', this.isAdmin = false, this.isLoggedIn = false});
  String get getPassword => _password;
  set setPassword(String newPassword) => _password = newPassword;
}