import 'package:equatable/equatable.dart';

class AuthenticationData extends Equatable {
  AuthenticationData({required this.passCode});

  final String passCode;

  @override
  List<Object?> get props => [passCode];
}
