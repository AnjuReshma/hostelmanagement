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
    apiKey: 'AIzaSyBj8LJK9jzw1yiLUAEHZxEKAj6An43pPLM',
    appId: '1:490228554817:web:2598647bc365d68c32bac0',
    messagingSenderId: '490228554817',
    projectId: 'hostelhappy-5d683',
    authDomain: 'hostelhappy-5d683.firebaseapp.com',
    storageBucket: 'hostelhappy-5d683.appspot.com',
    measurementId: 'G-P2LXMBP0QQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXW3NxoOixNRGpm5xOGmj4Q2ZwmkY31FE',
    appId: '1:490228554817:android:216a5856a04c7f8b32bac0',
    messagingSenderId: '490228554817',
    projectId: 'hostelhappy-5d683',
    storageBucket: 'hostelhappy-5d683.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPhAek3ih6PJV7Rr774dmMKlnQFtkALlg',
    appId: '1:490228554817:ios:e367cb9a52dc752b32bac0',
    messagingSenderId: '490228554817',
    projectId: 'hostelhappy-5d683',
    storageBucket: 'hostelhappy-5d683.appspot.com',
    iosBundleId: 'com.example.hostelmanagementproject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPhAek3ih6PJV7Rr774dmMKlnQFtkALlg',
    appId: '1:490228554817:ios:91796ee37b0edfcc32bac0',
    messagingSenderId: '490228554817',
    projectId: 'hostelhappy-5d683',
    storageBucket: 'hostelhappy-5d683.appspot.com',
    iosBundleId: 'com.example.hostelmanagementproject.RunnerTests',
  );
}
