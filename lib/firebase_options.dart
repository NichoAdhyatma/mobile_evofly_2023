import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyAUhP6K14S6T59ZPlTjU9STZ9uT8gX2LSo',
    appId: '1:454380954716:web:9ef83bc2ace9d3be3c3299',
    messagingSenderId: '454380954716',
    projectId: 'evofly-767be',
    authDomain: 'evofly-767be.firebaseapp.com',
    storageBucket: 'evofly-767be.appspot.com',
    measurementId: 'G-58Q8D1XSY5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvaYCSm2VViq-hKGdqBU1j6aIdWdq-jYA',
    appId: '1:454380954716:android:9b684af54745fad53c3299',
    messagingSenderId: '454380954716',
    projectId: 'evofly-767be',
    storageBucket: 'evofly-767be.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnt60x4XSZ2M5oayp_kA9mfiUSwFTjljI',
    appId: '1:454380954716:ios:23e32621d83488583c3299',
    messagingSenderId: '454380954716',
    projectId: 'evofly-767be',
    storageBucket: 'evofly-767be.appspot.com',
    iosClientId: '454380954716-hn643ct9r9bv903se06906d6cb6gvajg.apps.googleusercontent.com',
    iosBundleId: 'com.evofly.gemastik.evofly',
  );
}
