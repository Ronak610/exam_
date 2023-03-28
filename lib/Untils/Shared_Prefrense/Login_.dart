import 'package:shared_preferences/shared_preferences.dart';

class SheredHelper {
  SheredHelper._();

  static SheredHelper sheredHelper = SheredHelper._();
  void  Addlogin(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   sharedPreferences.setString('e1',email);
   sharedPreferences.setString('p1', password);
  }

  Future<String?> reademail()
  async {
    SharedPreferences sharedPreferences =await  SharedPreferences.getInstance();
    String? email = sharedPreferences.getString("e1");
    return email;
  }

  Future<String?> reagpassword()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? password = sharedPreferences.getString("p1");
    return password;
  }
}
