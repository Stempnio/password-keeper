import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credentials.g.dart';

@JsonSerializable(explicitToJson: true)
class Credentials extends Equatable {
  const Credentials({
    required this.websiteURL,
    required this.login,
    required this.passwordHash,
  });

  factory Credentials.fromJson(Map<String, dynamic> json) =>
      _$CredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialsToJson(this);

  final String websiteURL;
  final String login;
  final String passwordHash;

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

extension CredentialsUtils on Credentials {
  static Credentials emptyCredentials() =>
      Credentials(websiteURL: "", login: "", passwordHash: "");
}
