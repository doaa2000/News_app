import 'package:shared_preferences/shared_preferences.dart';

class CachHelper
{
  static SharedPreferences ?sharedPreferences ;
  static init()async
  {
  sharedPreferences= await SharedPreferences.getInstance();

 }
static Future<bool> putBoolean({
  required String key,
  required bool isDark,
})async
{
 return  await sharedPreferences!.setBool(key, isDark);
}

 static bool? getBoolean({
    required String key,
  })
  {
    return  sharedPreferences!.getBool(key);
  }
}