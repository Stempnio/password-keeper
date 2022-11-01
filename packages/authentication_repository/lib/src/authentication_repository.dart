import 'package:shared_preferences/shared_preferences.dart';
import 'models/models.dart';

class AuthenticationRepository {
  Future<bool> setAuthenticationData(AuthenticationData newAuthData) async {
    if (newAuthData.passCode.length < 5) {
      throw Exception(["Password too short!"]);
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("passcode", newAuthData.passCode);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> authenticationDataSaved() async {
    return await _getPasscode() != null ? true : false;
  }

  Future<bool> authenticate(AuthenticationData authenticationData) async {
    String? passcode = await _getPasscode();
    if (passcode == null) return false;

    return AuthenticationData(passCode: passcode) == authenticationData;
  }

  Future<String?> _getPasscode() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("passcode");
  }
}
