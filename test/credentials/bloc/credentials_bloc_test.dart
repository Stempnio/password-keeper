import 'package:credentials_service/credentials_service.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:password_keeper/credentials/credentials.dart';
import 'package:credentials_repository/credentials_repository.dart';
import 'package:firestore_credentials_service/firestore_credentials_service.dart';

const List<Credentials> _sampleCredentials = [
  Credentials(websiteURL: "website1", login: "login", passwordHash: "asdf"),
  Credentials(websiteURL: "website2", login: "login2", passwordHash: "asdf"),
  Credentials(websiteURL: "website3", login: "login3", passwordHash: "aaaa"),
  Credentials(websiteURL: "website4", login: "login4", passwordHash: "bbbb"),
];

void main() {
  late CredentialsRepository repository;

  setUp(() {
    var user = MockUser(email: "email@a.com");
    var fakeFirebaseAuth = MockFirebaseAuth(
      mockUser: user,
      signedIn: true,
    );
    var fakeFirestore = FakeFirebaseFirestore();

    var service = FirestoreCredentialsService(
      firebaseAuth: fakeFirebaseAuth,
      firebaseFirestore: fakeFirestore,
    );
    repository = CredentialsRepository(service: service);
  });

  blocTest(
    "adding credentials",
    build: () => CredentialsBloc(credentialsRepository: repository),
    act: (bloc) => bloc
      ..add(CredentialsSubscriptionRequested())
      ..add(CredentialsAdded(credentials: _sampleCredentials[0])),
    expect: () => [
      const CredentialsState(
        status: CredentialsStatus.loading,
        credentials: [],
      ),
      const CredentialsState(
        status: CredentialsStatus.success,
        credentials: [],
      ),
      CredentialsState(
        status: CredentialsStatus.success,
        credentials: [_sampleCredentials[0]],
      ),
    ],
  );

  blocTest(
    "adding and then removing credentials",
    build: () => CredentialsBloc(credentialsRepository: repository),
    act: (bloc) => bloc
      ..add(CredentialsSubscriptionRequested())
      ..add(CredentialsAdded(credentials: _sampleCredentials[0]))
      ..add(CredentialsDeleted(credentials: _sampleCredentials[0])),
    expect: () => [
      const CredentialsState(
        status: CredentialsStatus.loading,
        credentials: [],
      ),
      const CredentialsState(
        status: CredentialsStatus.success,
        credentials: [],
      ),
      CredentialsState(
        status: CredentialsStatus.success,
        credentials: [_sampleCredentials[0]],
      ),
      const CredentialsState(
        status: CredentialsStatus.success,
        credentials: [],
      ),
    ],
  );

  blocTest(
    "removing nonexistent credentials does not emit new state",
    build: () => CredentialsBloc(credentialsRepository: repository),
    act: (bloc) => bloc
      ..add(CredentialsSubscriptionRequested())
      ..add(CredentialsDeleted(credentials: _sampleCredentials[0])),
    expect: () => [
      const CredentialsState(
        status: CredentialsStatus.loading,
        credentials: [],
      ),
      const CredentialsState(
        status: CredentialsStatus.success,
        credentials: [],
      ),
    ],
  );

  blocTest(
    "adding same credentials twice does not emit a new state",
    build: () => CredentialsBloc(credentialsRepository: repository),
    act: (bloc) => bloc
      ..add(CredentialsSubscriptionRequested())
      ..add(CredentialsDeleted(credentials: _sampleCredentials[0]))
      ..add(CredentialsDeleted(credentials: _sampleCredentials[0])),
    expect: () => [
      const CredentialsState(
        status: CredentialsStatus.loading,
        credentials: [],
      ),
      const CredentialsState(
        status: CredentialsStatus.success,
        credentials: [],
      ),
    ],
  );

  blocTest(
    "editing credentials",
    build: () => CredentialsBloc(credentialsRepository: repository),
    act: (bloc) => bloc
      ..add(CredentialsSubscriptionRequested())
      ..add(CredentialsAdded(credentials: _sampleCredentials[0]))
      ..add(CredentialsEdited(
        editedCredentials: _sampleCredentials[0],
        newCredentials: _sampleCredentials[0].copyWith(passwordHash: "newhash"),
      )),
    expect: () => [
      const CredentialsState(
        status: CredentialsStatus.loading,
        credentials: [],
      ),
      const CredentialsState(
        status: CredentialsStatus.success,
        credentials: [],
      ),
      CredentialsState(
        status: CredentialsStatus.success,
        credentials: [_sampleCredentials[0]],
      ),
      CredentialsState(
        status: CredentialsStatus.success,
        credentials: [_sampleCredentials[0].copyWith(passwordHash: "newhash")],
      ),
    ],
  );
}
