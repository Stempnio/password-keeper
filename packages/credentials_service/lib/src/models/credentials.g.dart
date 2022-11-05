// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credentials _$CredentialsFromJson(Map<String, dynamic> json) => Credentials(
      websiteURL: json['websiteURL'] as String,
      login: json['login'] as String,
      passwordHash: json['passwordHash'] as String,
    );

Map<String, dynamic> _$CredentialsToJson(Credentials instance) =>
    <String, dynamic>{
      'websiteURL': instance.websiteURL,
      'login': instance.login,
      'passwordHash': instance.passwordHash,
    };
