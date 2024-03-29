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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCIKgLZY1bf0WlvY0TgaW3Udm8usbPST30',
    appId: '1:76930849095:web:6d5960ba5c7bbf98e9d462',
    messagingSenderId: '76930849095',
    projectId: 'cat-management-a7bd0',
    authDomain: 'cat-management-a7bd0.firebaseapp.com',
    storageBucket: 'cat-management-a7bd0.appspot.com',
    measurementId: 'G-28FVBPNKQN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCykPo2-YYtcGKRHyy27WimKpTwoHr4NsU',
    appId: '1:76930849095:android:786ae501b00216ace9d462',
    messagingSenderId: '76930849095',
    projectId: 'cat-management-a7bd0',
    storageBucket: 'cat-management-a7bd0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGZdZfscqh4UrBg_Q8LhjCDC2XW30DTzM',
    appId: '1:76930849095:ios:63fc6557cc2845f8e9d462',
    messagingSenderId: '76930849095',
    projectId: 'cat-management-a7bd0',
    storageBucket: 'cat-management-a7bd0.appspot.com',
    iosClientId: '76930849095-bkse1h4puo3je8di981ojllo663gvne9.apps.googleusercontent.com',
    iosBundleId: 'com.example.catManagement',
  );
}
