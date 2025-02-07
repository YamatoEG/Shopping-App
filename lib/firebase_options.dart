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
    apiKey: 'AIzaSyDkxmoVve3n3Ox0TPmfPTL4vgR-w7gR2zs',
    appId: '1:649886804330:web:d5741bfb6ec88bc4985d13',
    messagingSenderId: '649886804330',
    projectId: 'shoppingapp-b16f0',
    authDomain: 'shoppingapp-b16f0.firebaseapp.com',
    storageBucket: 'shoppingapp-b16f0.firebasestorage.app',
    measurementId: 'G-MHYEXJ4EFT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdiSJeCKbttLv0h6n0HxcqXxDgGUByJCc',
    appId: '1:649886804330:android:c5ee4c7f945cb221985d13',
    messagingSenderId: '649886804330',
    projectId: 'shoppingapp-b16f0',
    storageBucket: 'shoppingapp-b16f0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBWCxTNfVF6bkJUo7IOGN2TUnin05_w4_o',
    appId: '1:649886804330:ios:25686f5466787e4a985d13',
    messagingSenderId: '649886804330',
    projectId: 'shoppingapp-b16f0',
    storageBucket: 'shoppingapp-b16f0.firebasestorage.app',
    iosBundleId: 'com.example.shoppingApp',
  );

}