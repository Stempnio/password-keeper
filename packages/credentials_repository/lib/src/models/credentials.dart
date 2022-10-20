import 'package:equatable/equatable.dart';

class Credentials extends Equatable {
  final String websiteURL;
  final String login;
  final String passwordHash;

  const Credentials({
    required this.websiteURL,
    required this.login,
    required this.passwordHash,
  });

  @override
  List<Object?> get props => [
        websiteURL,
        login,
        passwordHash,
      ];

  Credentials copyWith(
      String? websiteURL, String? login, String? passwordHash) {
    return Credentials(
      websiteURL: websiteURL ?? this.websiteURL,
      login: login ?? this.login,
      passwordHash: passwordHash ?? this.passwordHash,
    );
  }
}

extension on Credentials {
  static Credentials emptyCredentials() =>
      Credentials(websiteURL: "", login: "", passwordHash: "");
}
