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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxAPhp1m8x_HtHOeCKCr8t76J-6G64Qoc',
    appId: '1:656241777600:android:b71c5091234b8ce98ec625',
    messagingSenderId: '656241777600',
    projectId: 'woodlandshkadmin',
    storageBucket: 'woodlandshkadmin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBx_8fr0Mj3GPW-1D_LGXjrODJsuM2D02w',
    appId: '1:656241777600:ios:d07b8237c5b45d2d8ec625',
    messagingSenderId: '656241777600',
    projectId: 'woodlandshkadmin',
    storageBucket: 'woodlandshkadmin.appspot.com',
    iosClientId: '656241777600-0tt8s2gpq3h6tuhgsn2hgg0kruil6l5r.apps.googleusercontent.com',
    iosBundleId: 'com.costcointernational.woodlandshk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBx_8fr0Mj3GPW-1D_LGXjrODJsuM2D02w',
    appId: '1:656241777600:ios:d07b8237c5b45d2d8ec625',
    messagingSenderId: '656241777600',
    projectId: 'woodlandshkadmin',
    storageBucket: 'woodlandshkadmin.appspot.com',
    iosClientId: '656241777600-0tt8s2gpq3h6tuhgsn2hgg0kruil6l5r.apps.googleusercontent.com',
    iosBundleId: 'com.costcointernational.woodlandshk',
  );
}
