// import 'package:authentication_repository/authentication_repository.dart';
// import 'package:password_keeper/authentication/authentication.dart';
// import 'package:test/test.dart';
// import 'package:bloc_test/bloc_test.dart';
//
// void main() {
//   group('AuthenticationBloc', () {
//     AuthenticationRepository authenticationRepository =
//         AuthenticationRepository();
//     late AuthenticationBloc authenticationBloc;
//
//     setUp(() => authenticationBloc =
//         AuthenticationBloc(authenticationRepository: authenticationRepository));
//
//     test('Initial status is unauthenticated', () {
//       expect(authenticationBloc.state.status,
//           AuthenticationStatus.unauthenticated);
//     });
//
//     blocTest('Initial password is empty',
//         build: () => authenticationBloc,
//         act: (bloc) => bloc.add(AuthenticateWithData(
//             authenticationData: AuthenticationData(passCode: ""))),
//         expect: () => [
//               AuthenticationState(status: AuthenticationStatus.authenticated),
//             ]);
//   });
// }
