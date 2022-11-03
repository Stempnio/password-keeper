// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCLlXxJxHykO1FngnAceSlaT15XFBn1nd0',
    appId: '1:368421924159:web:5e0541e62ad8ebedcef78a',
    messagingSenderId: '368421924159',
    projectId: 'password-keeper-ba9a8',
    authDomain: 'password-keeper-ba9a8.firebaseapp.com',
    storageBucket: 'password-keeper-ba9a8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAh53p9eZzyVYTtdQIwivY6N72kmwoblPs',
    appId: '1:368421924159:android:3b013aa8ff5c74cbcef78a',
    messagingSenderId: '368421924159',
    projectId: 'password-keeper-ba9a8',
    storageBucket: 'password-keeper-ba9a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZGxTWjztVRoQMaFPrnb6fZdvD8Sq6Okg',
    appId: '1:368421924159:ios:acc8d80bdc24a1b3cef78a',
    messagingSenderId: '368421924159',
    projectId: 'password-keeper-ba9a8',
    storageBucket: 'password-keeper-ba9a8.appspot.com',
    iosClientId: '368421924159-69l8d2qifi8k3slgrq4fchpcakmom1l5.apps.googleusercontent.com',
    iosBundleId: 'com.example.passwordKeeper',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZGxTWjztVRoQMaFPrnb6fZdvD8Sq6Okg',
    appId: '1:368421924159:ios:acc8d80bdc24a1b3cef78a',
    messagingSenderId: '368421924159',
    projectId: 'password-keeper-ba9a8',
    storageBucket: 'password-keeper-ba9a8.appspot.com',
    iosClientId: '368421924159-69l8d2qifi8k3slgrq4fchpcakmom1l5.apps.googleusercontent.com',
    iosBundleId: 'com.example.passwordKeeper',
  );
}