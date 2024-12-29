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
        return windows;
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
    apiKey: 'AIzaSyCAuFnS0C4b5jIkmPE8QqaiYHZzt2Nqq6k',
    appId: '1:141831519703:web:9fb13f85b798f852d01f92',
    messagingSenderId: '141831519703',
    projectId: 'ecommerce-flutterapp-a5464',
    authDomain: 'ecommerce-flutterapp-a5464.firebaseapp.com',
    storageBucket: 'ecommerce-flutterapp-a5464.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgvHfkgWNR2Gs3rEmXf1sW3b2pDIuhEyA',
    appId: '1:141831519703:android:f4dbf8a15f6189ded01f92',
    messagingSenderId: '141831519703',
    projectId: 'ecommerce-flutterapp-a5464',
    storageBucket: 'ecommerce-flutterapp-a5464.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIhxoBku8Y2iVG2p9aL7vuGpYfprLF0dI',
    appId: '1:141831519703:ios:be5dfd61595ebefdd01f92',
    messagingSenderId: '141831519703',
    projectId: 'ecommerce-flutterapp-a5464',
    storageBucket: 'ecommerce-flutterapp-a5464.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIhxoBku8Y2iVG2p9aL7vuGpYfprLF0dI',
    appId: '1:141831519703:ios:be5dfd61595ebefdd01f92',
    messagingSenderId: '141831519703',
    projectId: 'ecommerce-flutterapp-a5464',
    storageBucket: 'ecommerce-flutterapp-a5464.firebasestorage.app',
    iosBundleId: 'com.example.ecommerceapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCAuFnS0C4b5jIkmPE8QqaiYHZzt2Nqq6k',
    appId: '1:141831519703:web:c0acfea4c0fe4146d01f92',
    messagingSenderId: '141831519703',
    projectId: 'ecommerce-flutterapp-a5464',
    authDomain: 'ecommerce-flutterapp-a5464.firebaseapp.com',
    storageBucket: 'ecommerce-flutterapp-a5464.firebasestorage.app',
  );
}