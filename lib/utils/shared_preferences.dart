import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  static const String _key = 'auth_token';

  // Save the token to SharedPreferences
  static Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, token);
  }

  // Retrieve the token from SharedPreferences
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  // Delete the token from SharedPreferences
  static Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

class ProfileImageStorage{
  static const String _key = 'image_url';
  // Save the token to SharedPreferences
  static Future<void> saveImage(String imageurl) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, imageurl);
  }

  // Retrieve the token from SharedPreferences
  static Future<String?> getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  // Delete the token from SharedPreferences
  static Future<void> deleteImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }

}
