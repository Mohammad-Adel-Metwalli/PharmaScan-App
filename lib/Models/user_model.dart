class UserModel
{
  String email, _password, username, city, phoneNumber;
  bool isAdmin;

  UserModel(this._password, {required this.email, this.username = '', this.city = '', this.phoneNumber = '', this.isAdmin = false});
  String get getPassword => _password;
  set setPassword(String newPassword) => _password = newPassword;
}