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
    apiKey: 'AIzaSyBBAYHTQIfMxy_B_DhC4t5AkqxGQ3CZIFE',
    appId: '1:126435308970:web:e7c83ed3d5b993efcb67d3',
    messagingSenderId: '126435308970',
    projectId: 'fit-track-291a2',
    authDomain: 'fit-track-291a2.firebaseapp.com',
    storageBucket: 'fit-track-291a2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABgbYgqDpih-OVIicdrgC8xa1ITtTpWU8',
    appId: '1:126435308970:android:339d4e15e5dc7edbcb67d3',
    messagingSenderId: '126435308970',
    projectId: 'fit-track-291a2',
    storageBucket: 'fit-track-291a2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvHmboaPF-vATu5joVnwll35ud3XvzjNA',
    appId: '1:126435308970:ios:7bfb2c2b1f89e657cb67d3',
    messagingSenderId: '126435308970',
    projectId: 'fit-track-291a2',
    storageBucket: 'fit-track-291a2.firebasestorage.app',
    iosBundleId: 'com.example.fitTrack',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvHmboaPF-vATu5joVnwll35ud3XvzjNA',
    appId: '1:126435308970:ios:7bfb2c2b1f89e657cb67d3',
    messagingSenderId: '126435308970',
    projectId: 'fit-track-291a2',
    storageBucket: 'fit-track-291a2.firebasestorage.app',
    iosBundleId: 'com.example.fitTrack',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBBAYHTQIfMxy_B_DhC4t5AkqxGQ3CZIFE',
    appId: '1:126435308970:web:cef4b08bbf990b7dcb67d3',
    messagingSenderId: '126435308970',
    projectId: 'fit-track-291a2',
    authDomain: 'fit-track-291a2.firebaseapp.com',
    storageBucket: 'fit-track-291a2.firebasestorage.app',
  );
}
