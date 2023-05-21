import 'package:shared_preferences/shared_preferences.dart';

class TokenHelper {
   getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get('token');
  }
}
