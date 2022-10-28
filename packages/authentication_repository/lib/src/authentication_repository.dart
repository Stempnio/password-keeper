import 'models/models.dart';

class AuthenticationRepository {
  AuthenticationData _authenticationData = AuthenticationData(passCode: "0000");

  Future<AuthenticationData> getAuthenticationData() async {
    return _authenticationData;
  }

  Future<void> setAuthenticationData(AuthenticationData newAuthData) async {
    if (newAuthData.passCode.length < 5) {
      throw Exception(["Password too short!"]);
    }
    _authenticationData = newAuthData;
  }

  Future<bool> authenticate(AuthenticationData authenticationData) async {
    return _authenticationData == authenticationData;
  }
}
