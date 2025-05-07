class UserModel
{
  String email, _password, username, city;

  UserModel(this._password, {required this.email, this.username = '', this.city = ''});
  String get getPassword => _password;
  set setPassword(String newPassword) => _password = newPassword;
}