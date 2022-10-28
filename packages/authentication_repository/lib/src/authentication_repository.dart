import 'models/models.dart';

class AuthenticationRepository {
  AuthenticationData authenticationData = AuthenticationData(passCode: "0000");

  Future<AuthenticationData> getAuthenticationData() async {
    return authenticationData;
  }

  Future<void> setAuthenticationData(AuthenticationData newAuthData) async {
    authenticationData = newAuthData;
  }
}
