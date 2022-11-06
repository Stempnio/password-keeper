import 'dart:async';

import 'package:credentials_service/credentials_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const String _credentialsCollection = "credentials";

/// {@template firestore_credentials_service}
/// Implementation of credentials service that uses Firebase Firestore
/// {@endtemplate}
class FirestoreCredentialsService implements CredentialsService {
  /// {@macro firestore_credentials_service}
  FirestoreCredentialsService({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firebaseFirestore;

  String _getUserEmail() {
    var email = FirebaseAuth.instance.currentUser?.email ?? '';
    if (email == '') {
      throw GetUserException();
    }

    return email;
  }

  @override
  Stream<List<Credentials>> getCredentials() {
    var userEmail = _getUserEmail();
    try {
      return _firebaseFirestore
          .collection(_credentialsCollection)
          .doc(userEmail)
          .collection(_credentialsCollection)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => Credentials.fromJson(doc.data()))
              .toList());
    } catch (e) {
      throw GetCredentialsException();
    }
  }

  @override
  Future<void> addCredentials(Credentials credentials) async {
    var userEmail = _getUserEmail();
    try {
      _firebaseFirestore
          .collection(_credentialsCollection)
          .doc(userEmail)
          .collection(_credentialsCollection)
          .doc(credentials.websiteURL)
          .set(credentials.toJson());
    } catch (e) {
      throw AddCredentialsException();
    }
  }

  @override
  Future<void> deleteCredentials(Credentials credentials) async {
    var userEmail = _getUserEmail();
    try {
      _firebaseFirestore
          .collection(_credentialsCollection)
          .doc(userEmail)
          .collection(_credentialsCollection)
          .doc(credentials.websiteURL)
          .delete();
    } catch (e) {
      throw DeleteCredentialsException();
    }
  }

  @override
  Future<void> editCredentials(
    Credentials editedCredentials,
    Credentials newCredentials,
  ) async {
    var userEmail = _getUserEmail();
    try {
      // websiteURL is ID for documents in firebase, no way to rename it other than delete and create record with new key
      if (editedCredentials.websiteURL != newCredentials.websiteURL) {
        deleteCredentials(editedCredentials);
        addCredentials(newCredentials);
      } else {
        _firebaseFirestore
            .collection(_credentialsCollection)
            .doc(userEmail)
            .collection(_credentialsCollection)
            .doc(newCredentials.websiteURL)
            .update(newCredentials.toJson());
      }
    } catch (e) {
      throw EditCredentialsException();
    }
  }
}
