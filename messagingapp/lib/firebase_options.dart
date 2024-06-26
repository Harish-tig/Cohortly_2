// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyB5M-4plr5fa4PZrtJBBjvQx2dVAacUXHc',
    appId: '1:132030536909:web:00bba823675d8ecdb21d84',
    messagingSenderId: '132030536909',
    projectId: 'messaging-ca43c',
    authDomain: 'messaging-ca43c.firebaseapp.com',
    storageBucket: 'messaging-ca43c.appspot.com',
    measurementId: 'G-J21HZ2NK54',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwGQI5xZ3J07PnHHTh0WUy0nE0LTWfUng',
    appId: '1:132030536909:android:4de685674b864ed6b21d84',
    messagingSenderId: '132030536909',
    projectId: 'messaging-ca43c',
    storageBucket: 'messaging-ca43c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA6_lLxzZyAgU3jhm3bs8ACqZZ9o1z6Gxs',
    appId: '1:132030536909:ios:e864921352ba33d8b21d84',
    messagingSenderId: '132030536909',
    projectId: 'messaging-ca43c',
    storageBucket: 'messaging-ca43c.appspot.com',
    iosBundleId: 'com.example.messagingapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA6_lLxzZyAgU3jhm3bs8ACqZZ9o1z6Gxs',
    appId: '1:132030536909:ios:e864921352ba33d8b21d84',
    messagingSenderId: '132030536909',
    projectId: 'messaging-ca43c',
    storageBucket: 'messaging-ca43c.appspot.com',
    iosBundleId: 'com.example.messagingapp',
  );
}
